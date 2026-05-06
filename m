Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3785CD3436
	for <qemu-rust@archiver.kernel.org>; Wed,  6 May 2026 12:35:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wKbTK-0007uy-7D; Wed, 06 May 2026 08:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wKbTJ-0007up-6Y
 for qemu-rust@nongnu.org; Wed, 06 May 2026 08:35:25 -0400
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wKbTC-0003io-Aq
 for qemu-rust@nongnu.org; Wed, 06 May 2026 08:35:24 -0400
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-2c156c4a9efso10822886eec.1
 for <qemu-rust@nongnu.org>; Wed, 06 May 2026 05:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778070914; cv=none;
 d=google.com; s=arc-20240605;
 b=cxDyGYpyA3RcNOzNx4sDxLsnUcimtBAoGaNkVQsEUG1KBHOC3MY6cy+hFvT1qe7uLn
 SF4LiarZyJUZNYfesBqo7izCmpk5poa4LjNjNJY3D6fvEtT9jYBIMROymvZg6kksTJ0j
 cCmKCENW2X7WkX34y0RWCHMiUQLJXI2O3o5gsVMoaevUsciuaqIXAVs99hU6MYN8j9BM
 bVUeQ7tAVOguu56iHcitRVAnzWqu+QvZTYGOr8eCZiAQmaAnVXmCLXd/aRuklWm4v978
 bT0+Ul/vV4pbx6wgefPa0beCWdu3TyinqMAj8T76gyaWa+p8ym+8PrKvZwktYALoIB/D
 Rojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BZ21pqGkUyvEAQnmL9wdHAatEv3asR7myjlgbmGsPxg=;
 fh=G/xuAxY3FRTglGuaiTz0DaAAuauvwW20GwyP/rYxfYU=;
 b=LjzPOgaOZ7BcL/No+lN5AcaHSwG7UwxyOSE7Qu6M/3gFjj+bh3qvaa7iPZGYpQomGn
 LT3KyrGsej1MqGw+AZZzHFWTg4ZbTqcWEV6HaUgglbtgQ8MwAR5rGwWwNu59zt99jRLM
 RJ9A7JD0WOTqYUEUSRq+yx4B149R8/RCNDBPQeF9sZ0aEUDNYX/ABuDn60hzieg+d8P4
 aHg0pK2JBUbh5hg1BP3oYM/insfZ2gL4b2P/sfztCKlxjrBn3WmYgSVb2vmmN3veylOz
 /ZQ4G6X4Re1er0QDu1EoIWaZUa1oSsppEwgvG4B37PwlVwt0GY/jYH3hhJcyVvpnJl4p
 dXCw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1778070914; x=1778675714; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZ21pqGkUyvEAQnmL9wdHAatEv3asR7myjlgbmGsPxg=;
 b=cgCJutkP2s2f15zZd+jO0xHjYJs1n3Y92osuiP7s4lfd0o+k5p5XI6gtBq7UcemWf1
 0y2JT2JT36uYvPAnCQUnNUIKPpPp+zJvifxjxC46ti4kxw4HVM4S1Jgc1OXUAFYJeHSM
 /9b5Y9+0VZjvdtvtvt01imi4ThtInPU2EqXEXRaa2BPz/Ez37vFApUrDWN7nneMyNgWL
 G7C2UeeuAFDVB5r9esrb+6V4fycpUfR6CDRiSZJCgQVMYTKLv3Irp5qLH7riwjgJ9Me1
 YBT2KZrSa8eXWsZhUceLrDipbGKDjiCKbQEGt12UgR7QP/aqMS2ylznLnQJwcZVqpSVa
 HQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778070914; x=1778675714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BZ21pqGkUyvEAQnmL9wdHAatEv3asR7myjlgbmGsPxg=;
 b=l/y5+uXq1n8j5aogPCTXWwGyoI0pPxPtdW0Wz5QBnJtpoDwr42DDrPmgcGkAu+VOAU
 1xhKHHr6hZO6u+lSSPo3/S2WJwgVZPkfyRroCPl9lEwwJrqE0JMpH66t9O3zS7bIkgiK
 Ggii5SBHaO0aoM6LWI69JD2L1Sbt+r48UWRhAVGbHTiBV6BUqRWIZtO6rN1G3yek7akl
 soUSiU0mVaNKtphVfwZRM5UAsXLRYRrQzKPfU6yac0IKuiK09rGSSX3lwjumNA5oMs8m
 hjirKRdCDBBdY6RrsfWNzy69oiW7emLwq+ORk12qM0k8BkAQmuXcUiVZWeyDIqMKhfCk
 sH4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wDxS1F0lHoBoxp5+BehvBARHvOZOm++92d9ZX40jgG01C5pn/q0IzaPKauVNb1l3NRbG6Yms0tTA=@nongnu.org
X-Gm-Message-State: AOJu0YyGxbnkwkrVlZQY3HD6xn+jLM8wcpQRNrsW4uQ4+LCODbbc3cVO
 jS/ocjAmJ6JChrzIRRYJAGasJPwdkx1NKpvtWTmlSpxEGuUu6l3Ydf6KFyfu75BGcAWbTNKLxeZ
 117YQQiVHJIgjLlZLMNnn1yOAILOSr5g=
X-Gm-Gg: AeBDievI/qRE55t2FGaAhZi/OOx9Vnp+jR5SuzXB/1OrC4Q3QbmqTFiMRS6QgZS3fQ4
 OKVSWys3djCz/2iBJtq+gGeuzrg2AOQ7CD7kAcc0+qeecUAM+qvYeyi/DMHrbFRsrNkB3NWFIl1
 HvKKjLVOMJiWx3Qf8JWSKpKOZnYV0JpSk/mg8PEl3vvQzQLuauxVpU8LOhiUuV3LkfOfb4UThx4
 obqZWf1rH/84kAkDexq/TfD/HH5RpE3ZW9fdn1PEj8T22ir+leXLuMVwvRRcTOYgXVJGj/ffHie
 Q7VN7H69RMXGw4EaKhU=
X-Received: by 2002:a05:7300:6ca8:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-2f54d696ab4mr1791711eec.5.1778070914407; Wed, 06 May 2026
 05:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-13-pbonzini@redhat.com>
 <87jyw0khu2.fsf@pond.sub.org> <87se84dcr8.fsf@pond.sub.org>
In-Reply-To: <87se84dcr8.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 6 May 2026 16:35:02 +0400
X-Gm-Features: AVHnY4KSxD334hfpCyBckur_w7FGr6r2-Ijwv4rlgVwC5lzqFx4XyiY0ajB8Nsk
Message-ID: <CAJ+F1CK5gBcMKhAbtUdZpoi76X7OVFHET=hL_ZsdQoRM45+VGw@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] scripts/qapi: generate high-level Rust bindings
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1335;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Hi

On Wed, May 6, 2026 at 3:01=E2=80=AFPM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> FYI, I just posted patches to get rid of QAPI type String:

ok, I'll review it. (fwiw, I am working on adding qapi-type and better
qom-prop qapi interop api)

>
>     Subject: [PATCH 0/4] qapi/net: Some doc improvement and cleanup
>     Date: Wed, 6 May 2026 12:54:17 +0200
>     Message-ID: <20260506105421.2461117-1-armbru@redhat.com>
>     https://lore.kernel.org/qemu-devel/20260506105421.2461117-1-armbru@re=
dhat.com/
>
>
> Markus Armbruster <armbru@redhat.com> writes:
>
> [...]
>
> >> +def rs_name(name: str) -> str:
> >> +    """
> >> +    Map @name to a valid, possibly raw Rust identifier.
> >> +    """
> >> +    name =3D re.sub(r'[^A-Za-z0-9_]', '_', name)
> >> +    if name[0].isnumeric():
> >
> > .isdigit()?  It's what c_name() uses...
> >
> >> +        name =3D '_' + name
> >
> > In review of v1, I pointed to "The Rust Reference"
> >
> >        Identifiers starting with an underscore are typically used to
> >        indicate an identifier that is intentionally unused, and will
> >        silence the unused warning in rustc.
> >
> >        https://doc.rust-lang.org/reference/identifiers.html
> >
> > You replied "In this case it doesn't really matter: public items (such
> > as QAPI enum entries, or struct fields) do not raise the unused warning
> > anyway."
> >
> > What gives us confidence rs_name() will only be used where it doesn't
> > really matter?
> >
> >> +    # based from the list:
> >> +    # https://doc.rust-lang.org/reference/keywords.html
> >> +    if name in ('Self', 'abstract', 'as', 'async',
> >> +                'await', 'become', 'box', 'break',
> >> +                'const', 'continue', 'crate', 'do',
> >> +                'dyn', 'else', 'enum', 'extern',
> >> +                'false', 'final', 'fn', 'for',
> >> +                'if', 'impl', 'in', 'let',
> >> +                'loop', 'macro', 'match', 'mod',
> >> +                'move', 'mut', 'override', 'priv',
> >> +                'pub', 'ref', 'return', 'self',
> >> +                'static', 'struct', 'super', 'trait',
> >> +                'true', 'try', 'type', 'typeof',
> >> +                'union', 'unsafe', 'unsized', 'use',
> >> +                'virtual', 'where', 'while', 'yield'):
> >> +        name =3D 'r#' + name
> >
> > TIL...
> >
> >> +    # avoid some clashes with the standard library
> >> +    if name in ('String',):
> >> +        name =3D 'Qapi' + name
> >
> > This hides the unwise use of 'String' in qapi/net.json from Rust.  I'd
> > rather rename that one.
>
> [...]
>
>


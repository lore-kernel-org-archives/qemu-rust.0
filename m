Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFE2FF885A
	for <qemu-rust@archiver.kernel.org>; Tue,  5 May 2026 08:59:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wKBcF-0007JG-Fm; Tue, 05 May 2026 04:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wKBcC-0007Iv-7J
 for qemu-rust@nongnu.org; Tue, 05 May 2026 04:58:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wKBc9-00032g-VO
 for qemu-rust@nongnu.org; Tue, 05 May 2026 04:58:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so31168885e9.3
 for <qemu-rust@nongnu.org>; Tue, 05 May 2026 01:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777971518; cv=none;
 d=google.com; s=arc-20240605;
 b=Lu0g0V1L2r2xtRP+TIpFVTtw+HOyUhTbkA22heEn5GY1TazW0QBOly9sgy1tZtfmLM
 NPJ8oGwlYtzW22nSjyotyJ8d/CTM3sc9K9SY+/Ht/zkCvZW4pLtXCJsxfLdWiFBaMyHH
 zYtoOty15eiJ2/R5mKoMbQiJAjT7lOnolywG0Li199lRj+L1vJnbFZu58h4gzEUN0pqJ
 S4jkot9ByrPatA0+j1GUd+GmXvC3PFmR1sv2/K0C0lc1uF8OVk/nOFso/J8GSrm00hJ0
 SQ92XPaxLN1auPz+pl7NNVe0fkpcD6I6QWErpz5mKo2FZlsK1YrVhGy81DkFVDATUulH
 Xkzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Jq95NupVIByeCTcE5wjvMS1EFuwRN99SjWngpCZhhzw=;
 fh=xxY58ejm8giXPpJAIOSa76pPl36wylAvzgHroePoqGQ=;
 b=Amli1NPucF8PN0sCZwDPDGI+8sNUjA787N5Yvu5lGlrMlyUAjlmX7NVmylhcsOoqQO
 XOIuUtg1mfhqKaI79Y82VHR8w1afqoPl+C2YHX//XhDc8aJbJjhjxbnnRCgp1JNKbaDS
 6NqkkPzZhnUia4JLK4X3lCyWRFhg0ISt/DwoGLST4HBjiitfEQCCRz+Eh2yI+cU4jw1E
 N50dRIfmy4wCW8/IS0x8iYc6rTVdkLbVoysv+51U4mfu69SktnQL3xP+Hi5K13Twrp/1
 xldD7+nlT2rYIqVbuLXYM835eAE6xsolPQLB5sVugA1UjI/vNkHls0fsdMxYkbZ76BKN
 sogg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777971518; x=1778576318; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jq95NupVIByeCTcE5wjvMS1EFuwRN99SjWngpCZhhzw=;
 b=SngJENth0ONzQxW1hn3jxtTQjhg9gIxH2d7NdqZelx0unzsRJv1Dikw38qBlnBZ8fn
 57BDpHgIeHfFW2qWmbMgE+Uk7UvCTM07ilVyJaKgo+VVfGEMOoeTSJGoh4LHKMzTZlZK
 AXAe8+C9doJvU3WjrbkwiKJwSlseHIrdpF080wEKHeKNWU8Rm6LplqMhLxakxxb3E0dL
 Vo+I42VHDgbjHlPMV61NU6aytyWQEvsq9Xi9JVcPuqkn33QRLltFsVmh1UmppLwkBxYT
 LceLK6GAyqLJCWVfJSi6DH40UZzse5ctaaOJZGHQ9wb+/RIllv0KNn7v/DKdJvU25YSY
 T7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777971518; x=1778576318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jq95NupVIByeCTcE5wjvMS1EFuwRN99SjWngpCZhhzw=;
 b=dXYKIBg355wYZkQVKp/NQoRRK+60gxYpGGEIBTtRlxulXc5n7b6NRnGmD2vpzPS/Q6
 eonpmJ19ipCnSYH8YGZ0XDzBscocjmNVQMLHqK4dYfj8ouTZFne31z/gDrVN29eBMi65
 KiTBeJ/IszIwazW1zCYhFFl45/d+yta4tL+KQI/CuHHOhWe51LAhEmQ5bvfv+1lE0Shq
 ggm9EF7Odcc+35/JRw9pMRgcpZ5Oqd03Hy7Z6cZk7G7Ed3YGAdjVv9E17sKLbRjgoRQb
 o3u2juDBNTo39EUWOPtonI3JejTfNFLkyIoVTleh7UhH5xgbL9To7DBfno2icco01mN7
 4nAg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Zob8GyZxdELFYU3VaLIyBsuSyKLzmOVyCp6l5hRDL4wsOoyv8QXvPvYzBiI6FCOL7bdkYqqF6ovM=@nongnu.org
X-Gm-Message-State: AOJu0YxrjgS2LeUR8YJqqKTegP6frZLdY33d9GkrpsjXzG70XFbZI1Q3
 Jdppc6bZhS9HGCGSWjE0IravNKmxEak5UgeMss7B3ZwYdm/Irnj2T55SDCDnMkU6FYrxRpq/VOy
 ubeYGsCsuqBp1fZjwwCCgZO5WNWoYPmjVh9N4CfRcxQ==
X-Gm-Gg: AeBDieuqL1EsG2zd2HfFwFQBZ8Mj2UjSvzCL9WNTJn0imgVDqd4HGX8AMR+MVF6BPPL
 GOx4Zy7ko1dycgurAyquhv/TXcU29DTsygtUkgHaUE9E6kO/Nee2bz8dcJNCH1Z24VxhjNGL2G3
 bBYz4YMYNlGKojWUcATDd99uh6ud8KKa8aseFZSpapJvWqfKXQ7gZT2OgXODTPRHjVS2CySdwkY
 s0b0rC9DSxGfBFVFCniDlAmPUCeO1XHdEIn94T1KwoUN6eW9mAZ7Hevf9XVEhLvAT7aCNUriTUe
 1PTciZkO9BYtLlq4/BzMTvWgzc69h+jBxzBUdYF3wuP6Y5QmWqHoPPIFCrp2
X-Received: by 2002:a05:600c:3496:b0:488:c40b:c8a4 with SMTP id
 5b1f17b1804b1-48d186dc879mr33038935e9.1.1777971517967; Tue, 05 May 2026
 01:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <87tssm5jq2.fsf@pond.sub.org>
In-Reply-To: <87tssm5jq2.fsf@pond.sub.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 5 May 2026 11:58:11 +0300
X-Gm-Features: AVHnY4L1dWEj5KjmX367VOEYy8Q1GAcs4mhkieKUVrO3W17MJgcdjcU6kD3cdE4
Message-ID: <CAAjaMXYN25NdzOKd7Sw9YGSi+aaT3rQA_3fVTc7MtoM5hteEnA@mail.gmail.com>
Subject: Re: Can we make QMP commands in Rust always be coroutine safe?
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, May 5, 2026 at 11:45=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> QMP commands that perform potentially blocking I/O can profit from
> running in a coroutine.  Ideally, we'd run all commands in coroutine
> context: most of them don't care, a few profit.  However, some existing
> commands may need fixing to run safely there.  Since we don't know which
> ones do, running in couroutine context is opt-in.  From
> docs/devel/qapi-code-gen.rst section "Commands":
>
>     Member 'coroutine' tells the QMP dispatcher whether the command handl=
er
>     is safe to be run in a coroutine.  It defaults to false.  If it is tr=
ue,
>     the command handler is called from coroutine context and may yield wh=
ile
>     waiting for an external event (such as I/O completion) in order to av=
oid
>     blocking the guest and other background operations.
>
>     Coroutine safety can be hard to prove, similar to thread safety.  Com=
mon
>     pitfalls are:
>
>     - The BQL isn't held across ``qemu_coroutine_yield()``, so
>       operations that used to assume that they execute atomically may hav=
e
>       to be more careful to protect against changes in the global state.
>
>     - Nested event loops (``AIO_WAIT_WHILE()`` etc.) are problematic in
>       coroutine context and can easily lead to deadlocks.  They should be
>       replaced by yielding and reentering the coroutine when the conditio=
n
>       becomes false.
>
>     Since the command handler may assume coroutine context, any callers
>     other than the QMP dispatcher must also call it in coroutine context.
>     In particular, HMP commands calling such a QMP command handler must b=
e
>     marked ``.coroutine =3D true`` in hmp-commands.hx.
>
>     It is an error to specify both ``'coroutine': true`` and ``'allow-oob=
': true``
>     for a command.  We don't currently have a use case for both together =
and
>     without a use case, it's not entirely clear what the semantics should
>     be.
>
> Can we make commands written in Rust always coroutine safe?

For async Rust, yes. Any type that doesn't implement the `Send` trait
cannot be held across an .await (i.e. yield). This'd make it
impossible to hold the BQL and yield, it would just not compile. You'd
need a simple executor (i.e. runtime) to run async code, possibly as
part of QEMU's existing event loop.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd


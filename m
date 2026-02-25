Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D58FD3776
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Feb 2026 17:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vvIrf-0007Bt-7d; Wed, 25 Feb 2026 12:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvIrc-00079Q-73
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 12:39:56 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvIra-0003gk-Ma
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 12:39:55 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7986e0553bdso6679957b3.2
 for <qemu-rust@nongnu.org>; Wed, 25 Feb 2026 09:39:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772041194; cv=none;
 d=google.com; s=arc-20240605;
 b=TM7OZ9oRr42YHRqzSaWXS2MReMo6rAh9HERlKZsgaH/gYr3LeO78+I+GFPZtdP5NBt
 7Krr6DjaPCmFhnY9qC717pZelTPcsaCeVo0eNUVKZFZO7h+QpjGZyBKAqBhbLnbnyAzQ
 i0GUtAQeLidruBTza5oSVvzH9tpRxt1epX7satjJXpU58oIoEbksPpqIKxoITq1zJ1Rd
 gMF+qodsHap+EHpOWT+djwcoxBQbIYmMQ2o0+Ib/0yh7Cr1jQKriM5Os6NP/rgJgGc/D
 ZLI0bZYZCWB89BGJ9EQ3g/LLvor4U0hlJg80L0VCE4AXSPPidAS26GKLjXZNaBDSLIwl
 MxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bdRGZOqeEOBOacNi4xKQxNU7losX1c7ejXBpAXBJYSs=;
 fh=+h/74UH56WFoefKSV4SaJLbvtfhahkEe2gPNFn5XP8E=;
 b=k4YYJmTGhjG6v6iwQix3esRTkjeQCsHEd87OAERDT3eIDcMyHIc8NxjnhDTxYz+436
 UFf6XCOyjpPvOlU4b5nGlCE+cCahk3Aejdx1SrWAQ8R+fNZSBKOusnTf3BfV58rJVknR
 W2qOwtfFTK3AwdyWx7xH0qDwqoGOAmhsjkaDr67/YFA2NLzDuV0qsxNys0hB4gErk0cQ
 CCmnAz8ddsmMVZyn0hwIZM9gUEdE9bwKNkknwcWXDXSZyoUUuzO+grlJM8cntdMsAHkM
 y/Cx06rrKe07fXjJBHtVG6QhjgHB8Y9Cl0EiQ63JrFRW3tu+9hfSgu3QQRC4dmFNA3uf
 4+6w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772041194; x=1772645994; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdRGZOqeEOBOacNi4xKQxNU7losX1c7ejXBpAXBJYSs=;
 b=NS9Fs5wG1W5c5ydgRjEWYtGRfC4xu9M3I1vTMwX0V6CIzHkzpM+IrTyHEgoQQGFew3
 SJRWTAfiqwhG8AitXxVSpitmbqGCk6Z70tJ3rzMyz9KxnozYzgVf/do7pgs3jDDNGDBW
 XyBPuUsj3b7rAcz5BniSQt7bbv/gKVYVnJtTnnDGEj36C/RqG8rKBF2ndS9auA2yUJLU
 OSHmDguzY5aYq4cZdA8UHnM4dG5kB0r4VpE935DdsmOxdIHnAJVWgWEWWMX2ZE8MV9sw
 TqN8r6GehuweWwPFfCuZtoebZDuxFnuoJN2iYD74lHNM6EW8OIuHbsBYenOxxMmlSMRy
 cEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772041194; x=1772645994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bdRGZOqeEOBOacNi4xKQxNU7losX1c7ejXBpAXBJYSs=;
 b=EZi4/XQG03a7RI/p415B+4YmNoLdWriu5WcE6R68Cob6X2ipPJTbYUTkMBonScCGDh
 2VeITlITBGyp/DY0nBTG/jbyq7GGK1OCYYPiQqP+5SwC45Nw+Z4RxHeqFIP6NMvnV/UE
 u2NUs3ob4xPZBOMoQTPUNie2/0qqP/Bqcgj3YHW7dVs23DNdK5CHRINEHqgch8yasdI7
 Mqams9EulpuldB9Oxn1yeiPQdx1JxXa0jwGOgbrL1LhFVYv6UaY8f9uwfGWS4WUjIZFb
 ur9wsKZioOKaZuEPO6kVdtQrLMfw7ktSkBff5gm6O4Im6Q4zznR7uP5ZHTFba1plzhYZ
 Qz+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw0JS3msy9swmECPHUUyiyNGWyw93XiOVt2M5jhRWxtrzI/goRrDjrLMghDXrMeKf0jx/9BEgYWUg=@nongnu.org
X-Gm-Message-State: AOJu0YzbQUaGR64gGvp/+elSmaxrn84asNLS2PcSUb+GrYX3b3wIe9fP
 iTHMCysc3n4IKxMK0N3aH1JdB8ZLtMcFAwWao8QGgPvxrxilL0SnnMDxwzpEcJa7lZMmMp5m4x8
 cgYNKq314Zv1XYdWOURaZ3Z4PsYE+4feeHFRuSsTeDw==
X-Gm-Gg: ATEYQzzsYahe25aR+yYARxCBwKot1ItTvYZKNF2oXxy/yJcv0y5oOjdyjBp1gPCek+D
 PacF53sEIiqWAFcaIVayyVGQFlFzaP4NK5HEKFY/qRF+7vgF/Pr1rEB9JnwHapCbrWCFrauyhNm
 8ZiyIJqgcUyC3/HuXjzljE/JCx16fyAV+aTexLBGhjG3B5BAhqHo7orudMCuEu5GLvGaalVzT/Z
 fpBI6rUBcz6U8tK36CKyZZafaCrVcY9cGJ062iIKPTT/xCrH2whodyhgeFLMRILjLXvu+9hBwaX
 HplXNh5jFGjbafNSvN8DvHM0kza3AK2AZyDc5TBfEm4SV3JmlUrDM3RqA/IUmIFcmnE=
X-Received: by 2002:a05:690c:e3ed:b0:794:d4c3:3152 with SMTP id
 00721157ae682-79828fc1d2amr153513077b3.31.1772041193583; Wed, 25 Feb 2026
 09:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20260211152508.732487-1-berrange@redhat.com>
 <20260211152508.732487-27-berrange@redhat.com>
 <CAFEAcA-08J-_dn22s858QtUPV32VM4OuAEgBV-WdmGGxvJSu0w@mail.gmail.com>
 <aZ8jpGpOWXf_lByk@redhat.com>
In-Reply-To: <aZ8jpGpOWXf_lByk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Feb 2026 17:39:42 +0000
X-Gm-Features: AaiRm52YXMf8w8v_OhOSDj2SrQrNPERXD2CrvWxsg1JskEemlg1rXj4AiPeS3kA
Message-ID: <CAFEAcA8sCi2HD33JuMY+JzsCFobOVhy9T9hPuizPhTfr8YXRqA@mail.gmail.com>
Subject: Re: [PATCH v6 26/27] util: add support for formatting thread info in
 messages
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, devel@lists.libvirt.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, 
 qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Wed, 25 Feb 2026 at 16:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Feb 19, 2026 at 10:29:56AM +0000, Peter Maydell wrote:
> > On Wed, 11 Feb 2026 at 15:29, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > After:
> > >
> > >   # qemu-system-x86_64 -object tls-creds-x509,id=3Dt0,dir=3Dfish -d '=
trace:qcrypto*'
> > >   qemu-system-x86_64: (772366:main): qcrypto_tls_creds_x509_load TLS =
creds x509 load creds=3D0x560db818e080 dir=3Dfish
> > >   qemu-system-x86_64: (772366:main): qcrypto_tls_creds_get_path TLS c=
reds path creds=3D0x560db818e080 filename=3Dca-cert.pem path=3D<none>
> > >   qemu-system-x86_64: (772366:main): Unable to access credentials fis=
h/ca-cert.pem: No such file or directory
> >
> > Even more output enabled by default that is pretty useless for most
> > uses of tracepoints and debug logging :-(
>
> Getting the thread info in qemu log output was the original primary
> motivating factor in this series. This short example doesn't show
> it, but when debugging/tracing QEMU it is pretty important to
> understand which messages are coming from different threads, so we
> can correctly interpret the control flow. Pretty much every logging
> framework these days will include some thread identifier by default,
> and IMHO it is reasonable to do this by default in QEMU too.

I have basically never found that I wanted to know in QEMU
tracing which thread was involved, so I would dispute its
importance in the general case.

There's plenty of other things that would be more interesting to
me to log by default: for instance in pretty much all our
tracepoints in devices we don't have any indication of which
device of possibly several instantiated in the system is the
one producing this log output; having an easy way to have the
tracepoints include e.g. the QOM path of the device involved
would be nice.

I don't object to providing optional logging of the host
thread for people and cases where it's useful. But it's
pretty useless to me, and if we always enable by default
all the optional stuff that might be useful to somebody
then the trace lines end up being a mile long and trace log
files can become huge. Why can't we have this be something like
 -d thread-ids,trace:qcrypto*
so people who want it can turn it on and people who don't
want it don't get it?

thanks
-- PMM


Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297CDC87FD1
	for <qemu-rust@archiver.kernel.org>; Wed,  6 Aug 2025 09:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ujac3-0001in-UM; Wed, 06 Aug 2025 05:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ujaa9-0000MW-Jd
 for qemu-rust@nongnu.org; Wed, 06 Aug 2025 05:37:13 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ujaa7-0004pZ-Mq
 for qemu-rust@nongnu.org; Wed, 06 Aug 2025 05:37:13 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-615622ed70fso10126950a12.3
 for <qemu-rust@nongnu.org>; Wed, 06 Aug 2025 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754473030; x=1755077830; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+UqFI1/PN506Bb7rCYGzgCe9CYkRyiz0BuTqy/BR8U=;
 b=A/DDh/k65kiQI2ZLAgJFvDQiw/XM8Z/fQcCJWXq3jlMzSMGSBa9TbricepNdzWI0lK
 DDFiOnfpYO1BSr3cqTaXfPD+fD+RKkducy9mh09Bp5b6wQCVkCal+GlbtVIqxm6iFKW/
 Y21JesG/mhCTNsP3rtI/x5DQpVmWzbt94G+vnNNlnCVJTB6MFKnl6GUqE8ZA1igfpo75
 MlGxxNQHweNaA+IV6nkwUc0y1L4kxO4TrKAK/FjjJarf8FnV58Kqrb2/CF/mKaeris5x
 fmqGNyHjyqwX/sJDhPUzqOsXd7dVr/vu91ZyF9bUJGVKskwJ9YWFR3Mf8HDOWfQq3kQ9
 so9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754473030; x=1755077830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+UqFI1/PN506Bb7rCYGzgCe9CYkRyiz0BuTqy/BR8U=;
 b=WTUVZEhqr/gpNd7+zSBoF+gpDG9aeRo1Obg5AdiplazkY9R4rthd79EzDI0i0SKwdW
 U1Y1JVgAC/s0yp0FkTesDUYCADdB6nmVBfDxti9nWnsol3HkjuAxlCmQLwuL6HPJn0Jf
 W83gzGggrEq1CgB5mklo5XErl9//XX03uRngnooGQIibP7UQulXIolmNGJN5cKCLqEpq
 PSCpiSLuUrYDDAMBztXT1VhgIxffa5IfICZfSL4KXnzU85lwgtUjTggCPFEULrTfUSOk
 ihE7MKxAQriFJrbmcctg3QDwiimGEu3qNqrGlROzS0n3MO/jYjjzA9eN0Aq5tdzkoFNb
 EYvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDEWiAxb9iLNvHBFrBpKfqDLDFPY6z+s3RuK8wbkvIEvIUVagY0wwBnvfQVEJqViTjReA2ozL6dG4=@nongnu.org
X-Gm-Message-State: AOJu0YzhfEn0cEtyxpXAXkbat+bsnVCEZaBMY7Ps8c7B6jM8kXx1debO
 NwKD3UvZvd1jYPWJA4iJ9Af6dQAXEwL04qirRcGRigZms4SfXPMKTNar80UdrOxdTJCNR822OAc
 3rTG/mVRJtHtgi4z21PSHc6dl048GwjjtVw5TgLCdHw==
X-Gm-Gg: ASbGncsCPKXmNEQ1hBsh+xS6DIgr1uqu3Lbyfl57KDyB7Nrb8vKAocVXK6R5kOKpDFG
 pr88eGSwXc1KdvJVmA1fo+KdXczPdww76ELtlhSp4cT4iCnzx8k8wX2Xe3+T3Qcojq3JFqQ3ag2
 NNkLKxH1VSP8ZovNT2U7WXh1BiX9XVx69oXg6ZWz1nG98VDRQmNiilWCE5c+eHWPUoJXvhWomsu
 gHEAxgw
X-Google-Smtp-Source: AGHT+IGe1KitGE2+htjyCZDB4lva09ealXKVoVL1OjoyncLf6cKJBiTcSP0XuySIEX4rfE02HtiEQHU5gWFcqt2IXEI=
X-Received: by 2002:aa7:d64b:0:b0:608:6501:6a1f with SMTP id
 4fb4d7f45d1cf-617960b2169mr1410619a12.1.1754473029795; Wed, 06 Aug 2025
 02:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
 <aJIrpoEhrl7aLBMg@redhat.com>
 <CAAjaMXa6ManykYJJk--vNZT7oeBW9UR2v6WixaaQ8LUCSjy9Ug@mail.gmail.com>
 <aJI0mr5HDgtE9HIc@redhat.com>
 <CAAjaMXZ0Dho+5FSyc4zkOZXZT6UvHtjgmpj6_0QZQcH_AD9=VQ@mail.gmail.com>
 <aJJFVgkt7R49ZwIF@redhat.com>
 <CAAjaMXYhWsWPoDdfoNyTGrJSRfiYJDqBkv8fC87+Zi3YCtU06Q@mail.gmail.com>
 <ad404bb4-93fb-4a27-995f-734e647c1da0@redhat.com>
In-Reply-To: <ad404bb4-93fb-4a27-995f-734e647c1da0@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 6 Aug 2025 12:36:43 +0300
X-Gm-Features: Ac12FXybkjYA4S9Z2djlMHF9OchSkOmkH-kC6z2pwZxXyt9H79SOievTjDb1oI0
Message-ID: <CAAjaMXZH75Ooyb+S-qTQfsDgj7VO0ed8fv5S_tYe=VC++ABy4w@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] rust: implement tracing
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello Paolo,

On Wed, Aug 6, 2025 at 12:03=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On 8/5/25 22:06, Manos Pitsidianakis wrote:
> >> If you're thinking this is all rather complicated, you'd be right,
> >> which is why for initial feature parity I figured the simplest is
> >> likely to just wrap the existing QEMU inline probe function, so
> >> Rust doesn't need to know about the different backends... yet...
>
> It's not too hard to add individual backends (other than dtrace---see
> below--and ust which doesn't build for me(*) and I wanted to deprecate).
>   Tanish is pretty close to being able to post initial work.

Ack, I look forward to it :) I hope my RFC provides them some
inspiration on what things (not) to do.

Thanks,

>
> > Yes, that indeed makes sense.  Generated C trace headers statically
> > linked to a standalone trace crate library for each subsystem, that
> > rust qemu crates can link to in return is the cleanest solution for
> > this approach IMHO, because doing this kind of codegen via macros
> > needs interaction with meson to generate the C sources and then run
> > bindgen all while compiling this one crate which is a single meson lib
> > target.
> >
> > It might be possible to generate the equivalent of the C code for each
> > backend just like this RFC generates only the log backend code, I'll
> > take a look out of curiosity...
> >
> >> FWIW, the original DTrace authors created a Rust crate with native
> >> rust integration of dynamic probes.
> >>
> >>    https://github.com/oxidecomputer/usdt
> >>
> >> I think that (somehow) we probably want to integrate that with QEMU
> >> and its tracetool.
>
> This unfortunately only works for macOS and Solaris.  It also has quite
> a few dependencies (~25) on other crates.  There is also a "probe" crate
> (https://github.com/cuviper/probe-rs) that is minimal and (currently)
> specific to Linux, which is what I planned to use.
>
> By the way, while I like the idea of using Rust format strings, there
> are parts of tracetool (e.g. format/log_stap.py) that need the printf
> strings, and also backends (e.g. backend/syslog.py) that call into libc
> and therefore need to use printf format strings.  So I think we're stuck.
>
> Paolo
>
> (*) that's because this tracepoint:
>
> visit_type_str(void *v, const char *name, char **obj) "v=3D%p name=3D%s o=
bj=3D%p
>
> incorrectly handles 'char **' as a string.  The breakage has been there
> since 2016, though probably it's only more recent versions of ust that
> actually fail to compile and until then the bug was latent until you
> enabled this tracepoint.  But it seems unlikely that anyone has used the
> ust backend recently.
>

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd


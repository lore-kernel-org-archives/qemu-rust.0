Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD1AE9A052
	for <qemu-rust@archiver.kernel.org>; Thu, 19 Feb 2026 17:05:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vt7T0-00022O-BW; Thu, 19 Feb 2026 12:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1vt7St-0001pj-LJ
 for qemu-rust@nongnu.org; Thu, 19 Feb 2026 12:05:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1vt7Sq-0006hZ-CP
 for qemu-rust@nongnu.org; Thu, 19 Feb 2026 12:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771520716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+KmzAu4+ybYUz0qFkRfQ96SFUwTEftZIh1X34TXIh8=;
 b=gsl/sSyi5XGS8k5XxIb8uVB2sC+Egcm+Y8zH6xLWUQyPtXH8Floqz13CkIF4OKbq1ZbfCW
 JYzEQYgQR2CFzhCWX25r+LU1bvxtCscxKS7BUMXOgSTovCEhozX/+IVbaFmhGrTHwvzO9Q
 KxaEuak8FYBlfMHlORFjcwHx/h7JuO0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-tVYWesiTObO-QwBtJ7THHg-1; Thu, 19 Feb 2026 12:05:15 -0500
X-MC-Unique: tVYWesiTObO-QwBtJ7THHg-1
X-Mimecast-MFC-AGG-ID: tVYWesiTObO-QwBtJ7THHg_1771520714
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-797af767486so15519387b3.2
 for <qemu-rust@nongnu.org>; Thu, 19 Feb 2026 09:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771520714; x=1772125514;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+KmzAu4+ybYUz0qFkRfQ96SFUwTEftZIh1X34TXIh8=;
 b=Gfkj5XFg99rrpybBYEeOOB17IgC5TIa/pj01S3vmYtU8Q091658G2ffSgpXKSZCN1G
 JHhgzYj1QJ5pjImFB5KIMIMDhlGn0aXTV51k8UF8s7JtAHDtm8Jtw1nRhdc1yl5vbgG4
 NVLLrXV/P1v4+2LbY2yVV5PxZfXM74YMfIyArLeHl6IZlJd44cYBxovfYoN3Z6sKkjW+
 fpRKF3sPOY/Njg8zbReSnQMVMJEXMehLXvoWCXQhq40hw6VgzR1II5YodF/qzj/JqWXC
 uXOOPucGwHjWO4JYzWHIzZ0BPyfg+QgAHEAuBMCbs7TixXcqM54Rt12lL5LpQZZB49GB
 F6Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBv2EPUe4I8ugxsj4+tKYQmn1ezj6iIWbrtp77I6uyAnz42oHRgmABxOA3RznuLKgNau9fkDZz+yg=@nongnu.org
X-Gm-Message-State: AOJu0YyQggPsd02aFEAsFCKsTOBsBUFcpxH+vAJqR48gJtKr0I8t3sK8
 t8eIisVs2BWqQZgMahLJssXwWR+EBKTN1GWR+/X3/SQmTC3aAs5n9t1+kOhuN/AaigQaergH9Kn
 jiCtb84sRN4oSJhBsPY32inY3lRkeF51CjCoPk3Yni9/fGGLNFqnCc75vcW/lzn18MA/8V0EWkv
 9F2TjwNmhQwSUozJEP8QxJxNuvcfhIOw==
X-Gm-Gg: AZuq6aIe9kmT9OtEV1OJ5+SQ0I+JoVST0Wt9v2j7syAI3sZr6py9Uj6KYMVwzbKgzcO
 Ra3ZLMcgLZ4oj7Sa+bDAsvCs/TF3fXjaeI1U8pIydAIPTF1/Ye+J80aWDV1dUMvEnWrAZdSEIKZ
 FHHnYTZ+p4zI6RBLsMbsDNBYR3MWZcEbjxjvkLphsaukTO9RGTurnJQVceO55Bh/G+/jKQ3fYo2
 msSX6Gd/rEUv4Nxu6IEvsZTVZxWwp4mB+DxGQ==
X-Received: by 2002:a05:690e:1382:b0:649:b216:c8b8 with SMTP id
 956f58d0204a3-64c5557346dmr3830674d50.4.1771520714342; 
 Thu, 19 Feb 2026 09:05:14 -0800 (PST)
X-Received: by 2002:a05:690e:1382:b0:649:b216:c8b8 with SMTP id
 956f58d0204a3-64c5557346dmr3830630d50.4.1771520713739; Thu, 19 Feb 2026
 09:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20260218192444.658046-1-jsnow@redhat.com>
 <20260218192444.658046-2-jsnow@redhat.com>
 <118306d2-8c7f-4b8d-bba7-bf4529c3cc9b@linaro.org>
In-Reply-To: <118306d2-8c7f-4b8d-bba7-bf4529c3cc9b@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 19 Feb 2026 12:05:02 -0500
X-Gm-Features: AaiRm50TcxCjOe1-l__dLf1xzpiyjZHjYcHpjhFIABOiah4WVU69EHRogCWuwk0
Message-ID: <CAFn=p-aDnE+YgE6e-cpLQZeNhG6Tw99jt6F_Gn5vz4_u4dZ7YQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: use checked_div to make clippy happy
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2s9yCQi-GD4g8bKRhmsM4sHf9Uyx_uB8wp_JmCucNN8_1771520714
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000db4e0b064b304e4d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

--000000000000db4e0b064b304e4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026, 10:39=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/19/26 05:24, John Snow wrote:
> > When upgrading from Fedora 41 to Fedora 43 for CI tests, clippy begins
> > complaining about not using checked_div instead of manually checking
> > divisors. Make clippy happy and use checked_div() instead.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   rust/hw/core/src/qdev.rs | 14 ++++++--------
> >   1 file changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
> > index 145e20a984f..c4a7312168f 100644
> > --- a/rust/hw/core/src/qdev.rs
> > +++ b/rust/hw/core/src/qdev.rs
> > @@ -425,18 +425,16 @@ pub const fn period_from_ns(ns: u64) -> u64 {
> >       }
> >
> >       pub const fn period_from_hz(hz: u64) -> u64 {
> > -        if hz =3D=3D 0 {
> > -            0
> > -        } else {
> > -            Self::PERIOD_1SEC / hz
> > +        match Self::PERIOD_1SEC.checked_div(hz) {
> > +            Some(value) =3D> value,
> > +            None =3D> 0,
> >           }
> >       }
> >
> >       pub const fn period_to_hz(period: u64) -> u64 {
> > -        if period =3D=3D 0 {
> > -            0
> > -        } else {
> > -            Self::PERIOD_1SEC / period
> > +        match period.checked_div(Self::PERIOD_1SEC) {
> > +            Some(value) =3D> value,
> > +            None =3D> 0,
> >           }
> >       }
> >
>
> These conversions are inconsistent about the placement of divisor and
> dividend.
>
> r~
>

Whoops, fugue state. I'll fix.

--000000000000db4e0b064b304e4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 18, 2026, 10:39=E2=
=80=AFPM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.o=
rg">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 2/19/26 05:24, John Snow wrote:<br>
&gt; When upgrading from Fedora 41 to Fedora 43 for CI tests, clippy begins=
<br>
&gt; complaining about not using checked_div instead of manually checking<b=
r>
&gt; divisors. Make clippy happy and use checked_div() instead.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0rust/hw/core/src/qdev.rs | 14 ++++++--------<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs<br>
&gt; index 145e20a984f..c4a7312168f 100644<br>
&gt; --- a/rust/hw/core/src/qdev.rs<br>
&gt; +++ b/rust/hw/core/src/qdev.rs<br>
&gt; @@ -425,18 +425,16 @@ pub const fn period_from_ns(ns: u64) -&gt; u64 {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pub const fn period_from_hz(hz: u64) -&gt; u=
64 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if hz =3D=3D 0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::PERIOD_1SEC / hz<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match Self::PERIOD_1SEC.checked_div(hz) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some(value) =3D&gt; value,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 None =3D&gt; 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pub const fn period_to_hz(period: u64) -&gt;=
 u64 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if period =3D=3D 0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::PERIOD_1SEC / period<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match period.checked_div(Self::PERIOD_1SE=
C) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some(value) =3D&gt; value,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 None =3D&gt; 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
<br>
These conversions are inconsistent about the placement of divisor and divid=
end.<br>
<br>
r~<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Whoops, fugue state. I&#39;ll fix.</div></div>

--000000000000db4e0b064b304e4d--



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgAPI-00057M-3N
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 17:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgAPG-000575-QH
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 17:31:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgAPE-0006Sd-VZ
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 17:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738881091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XvErDAAX4wr7158SLDmAc7o4gbw3Wspkwfwb2P9AaSM=;
 b=gNxR1L/eF83plu1UaOavcvnimmFYeI6WITXaLsBHTX4c6GxhTEiLN61pSZ3EBuWqncos7o
 TnJk990A0cRnjr+a77gF3s+sr9k79exeyZahdXhHWgVKmW4bWxr1WUNa+AkqqdVvhkV7t5
 IpJEuHz3y5/E5yymaCrXbfdkRa3Vuwo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-DLDorxviM-ul5Fy1NhmqnA-1; Thu, 06 Feb 2025 17:31:28 -0500
X-MC-Unique: DLDorxviM-ul5Fy1NhmqnA-1
X-Mimecast-MFC-AGG-ID: DLDorxviM-ul5Fy1NhmqnA
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43628594d34so8231095e9.2
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 14:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738881087; x=1739485887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvErDAAX4wr7158SLDmAc7o4gbw3Wspkwfwb2P9AaSM=;
 b=pLmGhNsFK9PC0eRxcVniHt3t55QngJSEnUvhD6j4/zITyJQczYBpwntYeK6I2ywgG/
 p4bkKKyv0vMeRcfQPOhjCddwpEfgDFFpFrs6EUTtcefOglRuK+IBw1q1DmLjiOf5L9VE
 ddwTHFo+XeXlN0lVjjp5hKRwhLdoolqLtDfR1kExMRrSf5Z4Kr3BPfzZK92WEZOwqhfM
 pFV5g8Sw1TAiDur9U3N2vhtwymx8GEitrTF+VQWlHCg/5+PR1d7D4CWV/BTJCN1qWfZN
 5n2KnpFtxe1I1Mcpvabx78NO9X46A3K59x+4vcWqd+OrhA0abOQK5ruRJKIGbMAjpRA5
 R43Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1N/YrDRULwpMcc5en4zx9xZObTwYKnsxRNJECaC2IWMCW+L3/VOlozkd6zvxsnd/Q7wJDkDxXrwU=@nongnu.org
X-Gm-Message-State: AOJu0YzFCt2YkTuxLL1OJW3A2rwy1PFjxClHfb3cp4gV/xYL9c/VCwql
 ImffPY9lOky4F19fHEG3NRusvDi95Vqg166oFtCgl0W4l7s/nBWieZ8QLC+UIlZibfeSUG7kDfz
 dqe9SamEG33u3Taq9oM9EopnhGgGI1eEuikuAAOj0PO4rCjv62/cn1Aa+W9k3dYFaWFA/0sfcxs
 lzk841fbdfJu2JD2uAwgcrvi4YcQ==
X-Gm-Gg: ASbGnctb1tKCpEfllC5bZ15EmoulO1mmglUWhpRFtP2tL0m3fhiRtuu87dTZ0XuqH52
 O00lxSKBlEjS3h+gCX1WEfTvkr3w8lo2ZKlSRmFIzCbIIYqdPM4vkjheRWHtP
X-Received: by 2002:a05:6000:4029:b0:38c:4a05:c25f with SMTP id
 ffacd0b85a97d-38dc9333a68mr395226f8f.42.1738881087143; 
 Thu, 06 Feb 2025 14:31:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOy4wfnIaa7P8x8MkhA12rcAAalDSd0dGxRBPaJibAfFMzhJf7FfKErLp4zQC3lRhQmB/vT4U0jNqjiA3RUrU=
X-Received: by 2002:a05:6000:4029:b0:38c:4a05:c25f with SMTP id
 ffacd0b85a97d-38dc9333a68mr395195f8f.42.1738881085883; Thu, 06 Feb 2025
 14:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20250129083705.1321407-1-pbonzini@redhat.com>
 <20250129083705.1321407-3-pbonzini@redhat.com>
 <Z6SWrSZ1HSyIc52q@intel.com>
In-Reply-To: <Z6SWrSZ1HSyIc52q@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 6 Feb 2025 23:31:16 +0100
X-Gm-Features: AWEUYZnTRKxcyfdNPEv_IW8PyHlfW-3hZiC6--bsJzb0rAz74EmK2qpizNxq8xA
Message-ID: <CABgObfaKLUmbRwgvm0AkeAdJG5BCeQKO2TWfXz_1g1zcPAY6gQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: include rust_version in Cargo.toml
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S5Vist506pE4r7CWPrAueTHaci50fBRKGRUaFp3CFt8_1738881087
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006e5901062d80cdf6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 06 Feb 2025 22:31:35 -0000

--0000000000006e5901062d80cdf6
Content-Type: text/plain; charset="UTF-8"

Il gio 6 feb 2025, 11:42 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> > diff --git a/rust/hw/char/pl011/src/device_class.rs
> b/rust/hw/char/pl011/src/device_class.rs
> > index 8a157a663fb..dbef93f6cb3 100644
> > --- a/rust/hw/char/pl011/src/device_class.rs
> > +++ b/rust/hw/char/pl011/src/device_class.rs
> > @@ -12,7 +12,6 @@
> >
> >  use crate::device::{PL011Registers, PL011State};
> >
> > -#[allow(clippy::missing_const_for_fn)]
>
> It seems like a rebase nit since the commit 7d0520398f7f ("rust: prefer
> NonNull::new to assertions"), which is not worth an extra commit either.
>

It's not; adding rust_version let's Clippy know that this function cannot
be const in all supported versions of the standard library.

Paolo

>  extern "C" fn pl011_clock_needed(opaque: *mut c_void) -> bool {
> >      let state = NonNull::new(opaque).unwrap().cast::<PL011State>();
> >      unsafe { state.as_ref().migrate_clock }
>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>
>

--0000000000006e5901062d80cdf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 6 feb 2025, 11:42 Zhao Li=
u &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; ha=
 scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; d=
iff --git a/rust/hw/char/pl011/src/<a href=3D"http://device_class.rs" rel=
=3D"noreferrer noreferrer" target=3D"_blank">device_class.rs</a> b/rust/hw/=
char/pl011/src/<a href=3D"http://device_class.rs" rel=3D"noreferrer norefer=
rer" target=3D"_blank">device_class.rs</a><br>
&gt; index 8a157a663fb..dbef93f6cb3 100644<br>
&gt; --- a/rust/hw/char/pl011/src/<a href=3D"http://device_class.rs" rel=3D=
"noreferrer noreferrer" target=3D"_blank">device_class.rs</a><br>
&gt; +++ b/rust/hw/char/pl011/src/<a href=3D"http://device_class.rs" rel=3D=
"noreferrer noreferrer" target=3D"_blank">device_class.rs</a><br>
&gt; @@ -12,7 +12,6 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 use crate::device::{PL011Registers, PL011State};<br>
&gt;=C2=A0 <br>
&gt; -#[allow(clippy::missing_const_for_fn)]<br>
<br>
It seems like a rebase nit since the commit 7d0520398f7f (&quot;rust: prefe=
r<br>
NonNull::new to assertions&quot;), which is not worth an extra commit eithe=
r.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">It&#39;s not; adding rust_version let&#39;s Clippy know that this functio=
n cannot be const in all supported versions of the standard library.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 extern &quot;C&quot; fn pl011_clock_needed(opaque: *mut c_void) =
-&gt; bool {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 let state =3D NonNull::new(opaque).unwrap().cast::=
&lt;PL011State&gt;();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsafe { state.as_ref().migrate_clock }<br>
<br>
Reviewed-by: Zhao Liu &lt;<a href=3D"mailto:zhao1.liu@intel.com" target=3D"=
_blank" rel=3D"noreferrer">zhao1.liu@intel.com</a>&gt;<br>
<br>
</blockquote></div></div></div>

--0000000000006e5901062d80cdf6--



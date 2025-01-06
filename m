Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tUlfu-0004Fv-SG
	for mharc-qemu-rust@gnu.org; Mon, 06 Jan 2025 06:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tUlft-0004FR-La
 for qemu-rust@nongnu.org; Mon, 06 Jan 2025 06:53:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tUlfs-0006Cr-5n
 for qemu-rust@nongnu.org; Mon, 06 Jan 2025 06:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736164413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lrJf0OZJlWd3exazIEc9JY4LwQ2ngv0zCiOY5QT4+lA=;
 b=Hc30fWoABWdBQ48VEKKb2OiBax1HOR10sKkfzz0Wly8hTCqR8gV2ytvVmSyKGogcRzmgz2
 lSg1l0D+KfWg6sfi1ThZGnGSF9wlb8Txmm2Gq7fsjyvRoF5UEDoAhfWLBvR13kQ2zCQ79I
 U0GY2p9GRYBhKg469sD2gacXUJJKskc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-yLGURMFxNIKbY5eHvGCP5Q-1; Mon, 06 Jan 2025 06:53:32 -0500
X-MC-Unique: yLGURMFxNIKbY5eHvGCP5Q-1
X-Mimecast-MFC-AGG-ID: yLGURMFxNIKbY5eHvGCP5Q
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43628594d34so41094675e9.2
 for <qemu-rust@nongnu.org>; Mon, 06 Jan 2025 03:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736164410; x=1736769210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrJf0OZJlWd3exazIEc9JY4LwQ2ngv0zCiOY5QT4+lA=;
 b=v1NF20ugyECruoVt/8Zn6TLapAYGBYtPCXSYGUmLc/rfkX1eyJYFRCiowqDfLF++kW
 4AYkeXgbimLEMFqMRreW9/xEiCSzShnF96ahLCBbNJqoANnShTjOx6ctA4BmFJPtOEP5
 +1rLYvBnJsiZ2WuJsyNGSyvJ6V0jOoTruwe8t9CtRDyuM47xfi2JCKGkBoPTxp4sXt2N
 U1sT3ySp2XuBpZ96xBu42TZeut8xvGI7KHe+NvDZeIghTy/Im19XLkQ72hRoUeNJ8mN5
 nU5rD2WPpPgu3Oz70fP4mshSBkZCGxywuHmYvahZd+Vw8hlUStK7nTts3dzS3NLSTIh/
 awyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUO+K0DMZLWNjwEhwFZxajwphr8Ei4l2HEcwaTpT7h1dfeguvFlii9ADWGANECp4Mgz65WcZX0PEk=@nongnu.org
X-Gm-Message-State: AOJu0Yw2Unf8ZyhrWR/1w8DS4Vw+G3vfBmy7XozijaCF7wsoMhNXuyad
 0P8hzhD9W3w0hofNb4ukCF4QZ95VMtABzYH/VxqlkWIPKmC0BtRkmITgp5Poux/JWf/jx5XPhnf
 ZtlIb6cEK+WrO/mxxJQtBT+NtLjry0wxYSEepO7ekDZTZhN8f8x+MItY9PHHW5INAxTNLineNp4
 7jcZuUFqUkvnUk3gZ80jBa/IsNaG0mJcJto67TwD4=
X-Gm-Gg: ASbGncumrwT/l4XgwkY9mnoFPHsWgAMwPP+oCGEvO0ciXdAlUTrXBn92X9Qn+50w1yO
 uBoTGaAS1YTgYBkU6SKv3sOYdzXJm+VzOPa/HaA==
X-Received: by 2002:a05:600c:350c:b0:434:fdaf:af2d with SMTP id
 5b1f17b1804b1-43668b7850emr503577965e9.30.1736164409783; 
 Mon, 06 Jan 2025 03:53:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDEZ1FGompk//dN3WUnBX/k7KaupB8KjNk+sNifa/NAmzMSM+29G9fgKu7Xakedb9srOy5Qr20KvgyKlZD30I=
X-Received: by 2002:a05:600c:350c:b0:434:fdaf:af2d with SMTP id
 5b1f17b1804b1-43668b7850emr503577755e9.30.1736164409496; Mon, 06 Jan 2025
 03:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20241219083228.363430-1-pbonzini@redhat.com>
 <20241219083228.363430-26-pbonzini@redhat.com>
 <daea6757-a67b-45d5-bf2a-807fd9569a70@linaro.org>
In-Reply-To: <daea6757-a67b-45d5-bf2a-807fd9569a70@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 6 Jan 2025 12:53:17 +0100
Message-ID: <CABgObfYMP5-9uN9cLofPT6DzBS_o1CVfbHbY8pwn9xjdOXOqgw@mail.gmail.com>
Subject: Re: [PULL 25/41] rust: qom: put class_init together from multiple
 ClassInitImpl<>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wbnw6ByUzkl65g8pBxdxH8TUQQoKZ0Fv6Dl2ZwkqNw0_1736164411
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e67628062b0846ac"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.446,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 06 Jan 2025 11:53:37 -0000

--000000000000e67628062b0846ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 2 gen 2025, 18:04 Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> ha
scritto:

> > +            unsafe {
> > +                bindings::device_class_set_legacy_reset(dc,
> Some(rust_reset_fn::<T>));
>
> Pre-existing, but since it appears on this patch, Rust device models
> should not implement this legacy interface. If a non-Rust parent
> implements it, I think we should convert the non-Rust parent before
> adding a Rust child. No clue how to check a parent don't implement
> this interface in Rust.
>
> Generally, we shouldn't access legacy API from Rust IMHO.
>

I disagree that device_class_set_legacy_reset() should not be used.
Three-phase reset is only needed for buses, and requires more code in order
to implement the Resettable interface. Devices gain nothing compared to
using device_class_set_legacy_reset().

In fact, perhaps it should have been named something like
device_class_set_simple_reset()...

Paolo

--000000000000e67628062b0846ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 2 gen 2025, 18:04 Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro=
.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bindings::dev=
ice_class_set_legacy_reset(dc, Some(rust_reset_fn::&lt;T&gt;));<br>
<br>
Pre-existing, but since it appears on this patch, Rust device models<br>
should not implement this legacy interface. If a non-Rust parent<br>
implements it, I think we should convert the non-Rust parent before<br>
adding a Rust child. No clue how to check a parent don&#39;t implement<br>
this interface in Rust.<br>
<br>
Generally, we shouldn&#39;t access legacy API from Rust IMHO.<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I disagree tha=
t device_class_set_legacy_reset() should not be used. Three-phase reset is =
only needed for buses, and requires more code in order to implement the Res=
ettable interface. Devices gain nothing compared to using device_class_set_=
legacy_reset().</div><div dir=3D"auto"><br></div><div dir=3D"auto">In fact,=
 perhaps it should have been named something like device_class_set_simple_r=
eset()...</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></d=
iv>

--000000000000e67628062b0846ac--



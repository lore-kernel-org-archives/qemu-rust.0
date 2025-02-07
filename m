Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgL45-0001cV-M4
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 04:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgL43-0001bZ-E0
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 04:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgL41-00082e-Ps
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 04:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738922060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=14N4LN9FPiVuAo2srZND+rufrzAZ5UTPmrbsIu/NbzQ=;
 b=BiLsFyP5Kim/KYvEiRP7E+V3K7wNcaKwayn7rnX/w0kgk7V6Y0NqzRA4T5lbuVET1cmz5r
 j7BhWcnC4XhPX2mJxsOYAbom5S0UA7FD4tvyBTZpGqW0Gs67Cricg5muVGVM07xs8+BZTj
 ieyUyy3h+sUkx8b+U8+B+CgCwA5QduE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-jFxBw1YoOxO8-7Rg0SXcow-1; Fri, 07 Feb 2025 04:54:17 -0500
X-MC-Unique: jFxBw1YoOxO8-7Rg0SXcow-1
X-Mimecast-MFC-AGG-ID: jFxBw1YoOxO8-7Rg0SXcow
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-388d1f6f3b2so762068f8f.0
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 01:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738922056; x=1739526856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=14N4LN9FPiVuAo2srZND+rufrzAZ5UTPmrbsIu/NbzQ=;
 b=PekwzyiNp+g/4Hx0obObviSxZ1JYysxfWcgCuXvpKdE3PYAIULC9CvPC7D7yzrp0rP
 THlzN0N/AfB64ootdGPTjWq/adsBGHVmA8bwtX8CQBGbSl61BanHxWsCGYdLnDs/6Rdj
 HGVByqQ40Ml3rJIkso8hLY7KlxPPk4iQQWsO0EtsLns0qXds0pblOZiJOwmiNQgdDMn1
 k7rvI+v2+76bTfUw1WuCrPHNrtRJ5q+wqixgYAeijLKLkj8SZKJbID7U76thNRv8064F
 BpMsF9laqgQh2Xv+luIS0Z7yToUU5vTlKcyANIpDClSW4jVMvdx/RCwdrJDDbgoBt2WP
 7EGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh+R/CDBNGs0Ed6/Mnx2K4C4NgFQU4hfmENbFcM0IKH1OFwJcrwMl7Od8JUHHLi463lOWTqkhXyYE=@nongnu.org
X-Gm-Message-State: AOJu0YzOSHtNUkqyThtakTWBZxMSkx0YdCg2xcGMf7vO05ATcw7WYx1e
 Tg/OOQjSVhz29KCdYGOWqXby3Hmx9cTuFWgCBoaVDjIUoN+Lmw+SqxgQuSoJJwHyN3K5yeoc8xp
 XFi/Vh8nBPFAP1QWXzDm7w6DYFYSTWvvNpLlgKQBzgkSMdqBfgGSYr/6c3NUOl/l8gbwerEAM1Q
 rEyH8toBBHNH43hGEXSi0Vr3UQWg==
X-Gm-Gg: ASbGncs0BIzyZeel5uyDsZrcKNpd513WusYM3mYrVEkko+N642FjTLCq2j2xECJ7d8K
 mLV16JeTCakH7rbucYqVAz5b9XusLZsfmqf3q06SwKXXva98VPFdsYAJAivbM
X-Received: by 2002:a5d:5f48:0:b0:38d:b409:7d46 with SMTP id
 ffacd0b85a97d-38dc959f9fbmr1778552f8f.48.1738922056342; 
 Fri, 07 Feb 2025 01:54:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl5OE8FSyqQJ2lqJo4WnAhWZgVl6JVKHTSxceTb5ID0uMEAc47pJhtaMTmfVKL+KZTlG+LUA80I+F/Rmz6QRI=
X-Received: by 2002:a5d:5f48:0:b0:38d:b409:7d46 with SMTP id
 ffacd0b85a97d-38dc959f9fbmr1778530f8f.48.1738922055978; Fri, 07 Feb 2025
 01:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20250125125137.1223277-1-zhao1.liu@intel.com>
 <20250125125137.1223277-5-zhao1.liu@intel.com>
 <5a19e7d2-9d69-45fe-812f-84145229876f@redhat.com> <Z6XHzXwoIklPZQ/I@intel.com>
In-Reply-To: <Z6XHzXwoIklPZQ/I@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 7 Feb 2025 10:54:04 +0100
X-Gm-Features: AWEUYZkpMUjEgdAOeT7C0ODn4XbHSMnbIytTWsCaZe5o4KIf8kL9ABrIgpKg3YU
Message-ID: <CABgObfYathYPF-KWrZv+33+iEA_j=ee7eJbJmzA5F2rpY-ktqw@mail.gmail.com>
Subject: Re: [PATCH 04/10] rust: add bindings for gpio_{in|out} initialization
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KXOCn9Q0ld81GcfR8rGYcZHYAuPhShqEblK-M3_u7kU_1738922056
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000706c23062d8a57cd"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 07 Feb 2025 09:54:23 -0000

--000000000000706c23062d8a57cd
Content-Type: text/plain; charset="UTF-8"

Il ven 7 feb 2025, 09:24 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> > Please add "let _: () = F::ASSERT_IS_SOME;", which is added by the
> > qdev_init_clock_in() patch.
> >
>
> Okay.
>
> I would add `assert!(F::is_some());` at the beginning of init_gpio_in().
>

Use the "let" so that it's caught at compile time.

There's a difference with origianl C version:
>
> In C side, qdev_get_gpio_in() family could accept a NULL handler, but
> there's no such case in current QEMU:
>
> * qdev_get_gpio_in
> * qdev_init_gpio_in_named
> * qdev_init_gpio_in_named_with_opaque
>
> And from code logic view, creating an input GPIO line but doing nothing
> on input, sounds also unusual.
>

Wouldn't it then crash in qemu_set_irq?

Paolo

So, for simplicity, in the Rust version I make the handler non-optional.
>
>
>

--000000000000706c23062d8a57cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 7 feb 2025, 09:24 Zhao Li=
u &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; ha=
 scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; P=
lease add &quot;let _: () =3D F::ASSERT_IS_SOME;&quot;, which is added by t=
he<br>
&gt; qdev_init_clock_in() patch.<br>
&gt; <br>
<br>
Okay.<br>
<br>
I would add `assert!(F::is_some());` at the beginning of init_gpio_in().<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Use=
 the &quot;let&quot; so that it&#39;s caught at compile time.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote=
_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
There&#39;s a difference with origianl C version:<br>
<br>
In C side, qdev_get_gpio_in() family could accept a NULL handler, but<br>
there&#39;s no such case in current QEMU:<br>
<br>
* qdev_get_gpio_in<br>
* qdev_init_gpio_in_named<br>
* qdev_init_gpio_in_named_with_opaque<br>
<br>
And from code logic view, creating an input GPIO line but doing nothing<br>
on input, sounds also unusual.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Wouldn&#39;t it then crash in qemu_set_irq?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_conta=
iner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">So, for simplicity,=
 in the Rust version I make the handler non-optional.<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000706c23062d8a57cd--



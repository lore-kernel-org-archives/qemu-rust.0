Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498D8CAC5A5
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Sep 2025 12:16:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1OPR-00050L-Bw; Wed, 24 Sep 2025 08:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v1OP7-0004ZI-0P
 for qemu-rust@nongnu.org; Wed, 24 Sep 2025 08:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v1OP1-0007YR-UQ
 for qemu-rust@nongnu.org; Wed, 24 Sep 2025 08:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758716113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+VJ81iI/BYOgcd30DJXdVmgjY7sz2jQMQ3ox4YPssAo=;
 b=Nsa97KCWFC91BOIe59LrVU/Jz+v+5O7e1WIwQDS9R+QIsI/SYdvMGVZ7rA7IfgrzdrRmBx
 QcyKiEJIQCGlbaNHeYM4V0LW/TKIapuOClbcBVJVBE8dbE+MAEg1JH70R8dcWIagakTsxn
 U+TOfHtReM7LZuZLscLgv8TYCjehi3U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-yLcTuR-LNrGk9C8vHhvV4w-1; Wed, 24 Sep 2025 08:15:11 -0400
X-MC-Unique: yLcTuR-LNrGk9C8vHhvV4w-1
X-Mimecast-MFC-AGG-ID: yLcTuR-LNrGk9C8vHhvV4w_1758716110
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46d88f7d691so14372455e9.3
 for <qemu-rust@nongnu.org>; Wed, 24 Sep 2025 05:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758716110; x=1759320910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+VJ81iI/BYOgcd30DJXdVmgjY7sz2jQMQ3ox4YPssAo=;
 b=PSvy/KtI4o8KFz5jP3XXZK/bJWwydcpmVudZmtCpOFeLnZPMZ15dMsuRp4khXP4VPE
 U2WePoExDnH0mOGscdoMUj6xCpuYs6+IoeHxn/ZMs4nRzu2fUOogcT67N2ktbV92O+iZ
 jFC1jeZTMlBYZ/kYC83IHQyeCoy0m80JzpBMN6V1OWJh7CnaFQhMExkCeNGHWpt6X2j/
 xo+KPwbW5Q1Q294sTjs2LGCY0eVzgD2bde5kn4GPEaik49ybrvaE8Wi6OclnNk0vRy5n
 7vgIoune25CYnkLH4qNN8JUqL1TZnB5LmSjLUBvk2Hw+qbKQ2f1Rnj/OHBNu5SuL84nE
 04cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFhbB8WwmWfAoDZIwa7WIRa7jD3NdsVIl/dVRHoXRrboHNSk+qFmh0kM9bNGkdNIWmbUhA04udMus=@nongnu.org
X-Gm-Message-State: AOJu0YxbCu+CnuuJsnNlAmew59cwHyBbNNa3vVf8NmAWG7UvZjogbprf
 W9kf1K5xgoNokA4BN6xbGWMU49LY1Zc8HqN6YEedDt8zsMaJs0W5MGDzQ6SYqxNlM46b1F8V0Px
 NYUVNFXgqzDW+Gz384em3fWE4g3LmO3sHGj+MUGj8eA8r3AfiWJ8uVbtlSpEJastnw1biOOIh5A
 zdG/+yQ4dcZixTFdFjq0294KcMBXpQJw==
X-Gm-Gg: ASbGnctTjkTFVFXEYFe58DeD/RIAhcoipNRQm59RpuVlU/ZoQYtIrmq/aBKCuZsrhbL
 8QBElXxDdlWalgUwBme47PBaqFYhQyV7EifxuceugC3LwTHL/fIfkCvRlZ5qETTCQuUaildPrmC
 O7S577ITibL0RfGM1saRIUqaB/61V8yNAdDBIk5jQ+4767GPZQqBnzd0W6Y+J1zElvyzg+86k3J
 pKf9DfW4EmXpAEnggsbfAJVg7c=
X-Received: by 2002:a05:600c:8b35:b0:46c:adf8:c845 with SMTP id
 5b1f17b1804b1-46e1d98cba8mr80830695e9.16.1758716109706; 
 Wed, 24 Sep 2025 05:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErRZSiHTOP3DZFlZz6QshcgI3XGibhpRXmjJP3YhkUw+ylIvbciUri+i/BfIy5ypo5QfAJGkuRxmsxPPZfoHo=
X-Received: by 2002:a05:600c:8b35:b0:46c:adf8:c845 with SMTP id
 5b1f17b1804b1-46e1d98cba8mr80830405e9.16.1758716109307; Wed, 24 Sep 2025
 05:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250920142958.181910-1-pbonzini@redhat.com>
 <20250920142958.181910-2-pbonzini@redhat.com>
 <aNK44f/1+VEiOUQs@intel.com>
In-Reply-To: <aNK44f/1+VEiOUQs@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 24 Sep 2025 14:14:58 +0200
X-Gm-Features: AS18NWCvW4P7x8NNkHbSZh_nqku4dMTJINVfzdBa5v5Z4kHTVmaag5Hci95STkA
Message-ID: <CABgObfZ-+Og8pJ02Dz7Wfk9_o=c-Wv60JAJjw-cX7a3du6yjkg@mail.gmail.com>
Subject: Re: [PATCH 1/7] rust: bql: add BqlRefCell::get_mut()
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9Yg1jkRzEWrT98b6pl0ASQVFeM2X1ONkxGDu_RkkZDU_1758716110
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f4d888063f8b000a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
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

--000000000000f4d888063f8b000a
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 23, 2025, 16:50 Zhao Liu <zhao1.liu@intel.com> wrote:

> > +    pub const fn get_mut(&mut self) -> &mut T {
> > +        // SAFETY: there cannot be any outstanding borrow,
> > +        // since `self` is mutably owned.
> > +        unsafe { &mut *self.as_ptr() }
>
> Why not use UnsafeCell::get_mut?
>
> self.value.get_mut()
>

Uh, of course. I thought it was too new, but it's even available as const
in 1.83.

Paolo

Regards,
> Zhao
>
>

--000000000000f4d888063f8b000a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 23, 2025, 16:50 Zhao=
 Liu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt;=
 wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 pub const fn get_mut(&amp;mut self) -&gt; &amp;mut T {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 // SAFETY: there cannot be any outstandin=
g borrow,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 // since `self` is mutably owned.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe { &amp;mut *self.as_ptr() }<br>
<br>
Why not use UnsafeCell::get_mut?<br>
<br>
self.value.get_mut()<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Uh, of course. I thought it was too new, but it&#39;s e=
ven available as const in 1.83.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Regards,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--000000000000f4d888063f8b000a--



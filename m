Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPIwi-0001SG-T6
	for mharc-qemu-rust@gnu.org; Wed, 11 Jun 2025 06:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPIwh-0001Ry-LR
 for qemu-rust@nongnu.org; Wed, 11 Jun 2025 06:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPIwg-0001qR-6P
 for qemu-rust@nongnu.org; Wed, 11 Jun 2025 06:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749638677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a3biw5Hv7V/UqjmZl5nf7Vojns2ZYwZifrL781Rftxk=;
 b=SZDNWV1zZJA7230YC4ucRtXfYmPw3QAkTy5B8aYbLXAcdgzhBxu/3/rj4qk3XPqxBUy0tl
 MTloaVGNamyi3RLQi02A7GqdXa5VlocF7BmDmxzHwHDKwMP2t1j9G3/vA4YEqs1WZl/6T9
 5eLbLQWwIKtRCizImwAVlg0KnvBI5sI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-8syzIik2NiKrFRFqyZTH4A-1; Wed, 11 Jun 2025 06:44:35 -0400
X-MC-Unique: 8syzIik2NiKrFRFqyZTH4A-1
X-Mimecast-MFC-AGG-ID: 8syzIik2NiKrFRFqyZTH4A_1749638674
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-450df53d461so56378035e9.1
 for <qemu-rust@nongnu.org>; Wed, 11 Jun 2025 03:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749638674; x=1750243474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a3biw5Hv7V/UqjmZl5nf7Vojns2ZYwZifrL781Rftxk=;
 b=cUpfQLfHeFXpQWh23GGxtE/52UNd8Paqq4MSkJUjLgzFP2Ul2IOa+2opPxkOA6ZyA/
 PSVpOF3+W5tpRAQt2UfDjdug4T9HYwcJVt3d2lLIvEXDs4uVhb3fTurdZKaW5Q5MFVwF
 Eyy7HcDA6ZEXL4lci93hHQ+JgCgpicUC8WICnTc2wu+rg0Yap7hbFNEmhox9CCmryaK9
 khms3+6MesH50WUtlEnGcAo+zhJKuX+e1BTXVyzxVz47ULAcbTSrPXx2brehwG9qlHP3
 j6KPd3xQ+3jWSCVeR/0yelz+eViR5xXRM7B7tJG7hnrxtKCbw6+Szzc/tSn5Y8czgPKT
 RZoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk07LjX2+NynR3QZd6mTVB4KczXU77wiikkqQaw8S4RbqedZKDA6rwB6rX7ZCF+TuA21fpo7E31Lc=@nongnu.org
X-Gm-Message-State: AOJu0YyGUMafUVFO+hRxnhty//i1Yftw+ktvpT2IlUfNBSjLmYOx8Wke
 9c+PQDho/4k7S7obguwho3Gb9BkHKBWU21bkmtFefcx8TAymzwSge0/OQKQvEBCPW06R8dsMHSk
 PVHUngrDf+B6mgQqvAw0aYn0PDJS0Ic+XDT8PMYAA3RYfvwwvbx6Xr6gAqdaDhqjwh79qes/tDt
 EqIa6ejVcP0zfkciMUb4YUyt3n3MjQDg==
X-Gm-Gg: ASbGncsl01ecc1EEpM6ESd8qTljCd5nLoYPHLeZ0iq6+wtesPX7ZQz2or170yIaMQQD
 pCZZGQgR7/vwKmheU7b/ycYZ/kihUj35cj49inZFzHiMn7zoE0iiHc0NepMCBRI+A+k8tuznKce
 naiQ==
X-Received: by 2002:a05:600c:3496:b0:453:8a6:d8de with SMTP id
 5b1f17b1804b1-4532907de44mr3803535e9.1.1749638674201; 
 Wed, 11 Jun 2025 03:44:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm7zHOvxzgU6boxcJBHAn2mBU78PB1FfApLX+OCzVkf+COwbw2uOhBZvk1Klh1SbutU9WBOJEhnS0PO/QupQ0=
X-Received: by 2002:a05:600c:3496:b0:453:8a6:d8de with SMTP id
 5b1f17b1804b1-4532907de44mr3803355e9.1.1749638673876; Wed, 11 Jun 2025
 03:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250610202110.2243-1-shentey@gmail.com>
 <20250610202110.2243-2-shentey@gmail.com>
 <e14ce991-7cd5-4875-bd99-5dc27a22be78@redhat.com>
 <03F26AC2-B53A-458E-9343-0254516F26DF@gmail.com>
In-Reply-To: <03F26AC2-B53A-458E-9343-0254516F26DF@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Jun 2025 12:44:22 +0200
X-Gm-Features: AX0GCFshyBONw3RhKthSKMlZckvCXg496Y-Nh35230zX3gtZ3_6Y7i-sgVNcvtc
Message-ID: <CABgObfZgPh1VnJR9BrpFn322sO8_S0+tUGznj7soohOVjLqpkQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust/qemu-api: Add initial logging support based
 on C API
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _4O8lVGIphzExjbDrnGrLW2JCE1jlG_7p7E_odZCHXQ_1749638674
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a45dfb0637497f0a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
X-List-Received-Date: Wed, 11 Jun 2025 10:44:39 -0000

--000000000000a45dfb0637497f0a
Content-Type: text/plain; charset="UTF-8"

Il mer 11 giu 2025, 12:21 Bernhard Beschow <shentey@gmail.com> ha scritto:

> Am 11. Juni 2025 07:56:23 UTC schrieb Paolo Bonzini <pbonzini@redhat.com>:
> >Clippy complains that it wants `` around the function name.
>
> Will fix in v3.
>

While at it, please run it through rustfmt and add a "//!" comment at the
top, such as "Bindings for QEMU's logging infrastructure".

You can build the documentation with "ninja rustdoc" so you can check the
result of the doc comments.

Thanks,

Paolo


> >
> >Paolo
> >
>
>

--000000000000a45dfb0637497f0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 11 giu 2025, 12:21 Bernha=
rd Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
m 11. Juni 2025 07:56:23 UTC schrieb Paolo Bonzini &lt;<a href=3D"mailto:pb=
onzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com=
</a>&gt;:<br>
&gt;Clippy complains that it wants `` around the function name.<br>
<br>
Will fix in v3.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">While at it, please run it through rustfmt and add a &quot;/=
/!&quot; comment at the top, such as &quot;Bindings for QEMU&#39;s logging =
infrastructure&quot;.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yo=
u can build the documentation with &quot;ninja rustdoc&quot; so you can che=
ck the result of the doc comments.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thanks,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt;<br>
&gt;Paolo<br>
&gt;<br>
<br>
</blockquote></div></div></div>

--000000000000a45dfb0637497f0a--



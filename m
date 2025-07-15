Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07320C83F17
	for <qemu-rust@archiver.kernel.org>; Tue, 15 Jul 2025 06:51:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ubZVG-0005Cx-8J; Tue, 15 Jul 2025 02:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ubZPN-00072I-Hq
 for qemu-rust@nongnu.org; Tue, 15 Jul 2025 02:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ubZPH-0007Cb-Qe
 for qemu-rust@nongnu.org; Tue, 15 Jul 2025 02:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752561889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g2GNShuYUsv/79m0VWED2XpRtfeIbdJGneDzm8z9mUs=;
 b=C4iysQeCwGLiD9mqMeQK1DUNz/M5Jt4Fr4I8Xnd5J6aod/XZszHjKTN+FRAyRma01tphW4
 xmoPyhmXujJjtzUi6hUUC2VlVhIhvTs18Cuncl6VH54FXX78F4bZSqxSUtCznVPvqQNnVu
 Bom7jTk2lc//e0hVXXOnZZdFy5JkuOU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-RHqW7xz_OTmdOi107NZ6WQ-1; Tue, 15 Jul 2025 02:44:47 -0400
X-MC-Unique: RHqW7xz_OTmdOi107NZ6WQ-1
X-Mimecast-MFC-AGG-ID: RHqW7xz_OTmdOi107NZ6WQ_1752561886
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4ff581df3so2073019f8f.1
 for <qemu-rust@nongnu.org>; Mon, 14 Jul 2025 23:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752561886; x=1753166686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g2GNShuYUsv/79m0VWED2XpRtfeIbdJGneDzm8z9mUs=;
 b=n+Xgo1HVJAlGqBkTzcaDtdqU9+xATxMZTTuKf1rG3gCHvZGWwwLjicq2ngYTgbclXo
 490CJG1jyPpU6vo59ZIDvuIKzFOfot/ISxwti+cBuNgNks0QY7q/2nH0sYgYXoX2euhL
 fze7eW397wPVqPStflyGhCmo9DeuPh6jxWjO4v//KJoIKV3pGyyuLYNHbvgfRjjFbq5D
 FDsRxN1g7MtTAvoE3+PUlePEy9mLwq/ySEB0iD6dykzyp7QnpISRo7LK35BkSLkGSfh7
 UNSpXnlHl1ZQUZRaW9FNs5i/XSvMwCCDI8Y7HOgVuuGk40H4BlB4AG8Tv/wWZNzZ9s5X
 Wg8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVudTXKY6fU4QwQ+4PLkHN1iX3DXK4lOb0VINrzaxv/X3tNOn0Ami06+2TDfiDiRBir99fYUg0ZROg=@nongnu.org
X-Gm-Message-State: AOJu0YzkCwjtnJSvT0ASXK2O296sE8RwnS0b0LU94HeYZZDebeBrZTTr
 lKu0pqgaHyETD7exMobhtR5tyQBJVSjBjvpzQD3gaoCW+V92zKpaHbzc3QBfm99Ofd1FMBWvL4K
 n8/4YUAgkbjIivreVxEvivhOkOEBHE/oZY2+wDOZPvjlPEPnt6UbVzAF4weYql37n0NClfybOBd
 PrVtb4RkFvZifRMyiAAOlYyN/6FMy1KQ==
X-Gm-Gg: ASbGncvdtT81yljnaeTPd333UV8tyRsYpmjQjWZytVQoOiVY27VpjBvIGT+ELCApB/i
 Glit8DqwISCP2VQhOjo8MRHCrz6B48YHJzP1Q0GAejdvFU8ol4qcUstB7BipmWUK1LByyQr3UTV
 KSURR9weEaRQeSeKzLoJTL
X-Received: by 2002:a05:6000:3110:b0:3a5:8991:64b7 with SMTP id
 ffacd0b85a97d-3b609544312mr1795089f8f.26.1752561885861; 
 Mon, 14 Jul 2025 23:44:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPhPAU4X0sG0qJswruXc3KZypwB/jrAiSfZ5Ssca/maHLnxPrpjARRTw8OVa1cpM5PTc030/cKMRAAKdeUhFc=
X-Received: by 2002:a05:6000:3110:b0:3a5:8991:64b7 with SMTP id
 ffacd0b85a97d-3b609544312mr1795070f8f.26.1752561885401; Mon, 14 Jul 2025
 23:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <e41344bd22248b0883752ef7a7c459090a3d9cfc.1752560127.git.mst@redhat.com>
In-Reply-To: <e41344bd22248b0883752ef7a7c459090a3d9cfc.1752560127.git.mst@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 15 Jul 2025 08:44:35 +0200
X-Gm-Features: Ac12FXzu2NbTTjK2Kn4T8A4WWAnztR5nmeHB8YOPJEHXzKtb9Xlb52OMm12BFYI
Message-ID: <CABgObfZE1bZkKqJgEHWLsnwcQ1Zfy2JLNKqudZEGQdA+Nc8TrA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bindings: allow any number of params
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YAqd_-aojlOcLcoDqvQtdVv3tW9k-vs-8e4sJj6VGsg_1752561886
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a06abd0639f21c08"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=unavailable autolearn_force=no
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

--000000000000a06abd0639f21c08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 15 lug 2025, 08:20 Michael S. Tsirkin <mst@redhat.com> ha scritto:

> We are going to be adding more parameters, and this makes
> rust unhappy:
>     Functions with lots of parameters are considered bad style and reduce
>     readability (=E2=80=9Cwhat does the 5th parameter mean?=E2=80=9D). Co=
nsider grouping
>     some parameters into a new type.
>
> Specifically:
>
> error: this function has too many arguments (8/7)
>     -->
> /builds/mstredhat/qemu/build/rust/qemu-api/rust-qemu-api-tests.p/structur=
ed/bindings.inc.rs:3840
> :5
>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


     |
> 3840 | /     pub fn new_bitfield_1(
> 3841 | |         secure: std::os::raw::c_uint,
> 3842 | |         space: std::os::raw::c_uint,
> 3843 | |         user: std::os::raw::c_uint,
> ...    |
> 3848 | |         address_type: std::os::raw::c_uint,
> 3849 | |     ) -> __BindgenBitfieldUnit<[u8; 4usize]> {
>      | |____________________________________________^
>      |
>      =3D help: for further information visit
> https://rust-lang.github.io/rust-clippy/master/index.html#too_many_argume=
nts
>      =3D note: `-D clippy::too-many-arguments` implied by `-D warnings`
>      =3D help: to override `-D warnings` add
> `#[allow(clippy::too_many_arguments)]`
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  rust/qemu-api/src/bindings.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.r=
s
> index 057de4b646..c4f1f755ce 100644
> --- a/rust/qemu-api/src/bindings.rs
> +++ b/rust/qemu-api/src/bindings.rs
> @@ -13,7 +13,8 @@
>      clippy::missing_const_for_fn,
>      clippy::ptr_offset_with_cast,
>      clippy::useless_transmute,
> -    clippy::missing_safety_doc
> +    clippy::missing_safety_doc,
> +    clippy::too_many_arguments
>  )]
>
>  //! `bindgen`-generated declarations.
> --
> MST
>
>
>

--000000000000a06abd0639f21c08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 15 lug 2025, 08:20 Michae=
l S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We ar=
e going to be adding more parameters, and this makes<br>
rust unhappy:<br>
=C2=A0 =C2=A0 Functions with lots of parameters are considered bad style an=
d reduce<br>
=C2=A0 =C2=A0 readability (=E2=80=9Cwhat does the 5th parameter mean?=E2=80=
=9D). Consider grouping<br>
=C2=A0 =C2=A0 some parameters into a new type.<br>
<br>
Specifically:<br>
<br>
error: this function has too many arguments (8/7)<br>
=C2=A0 =C2=A0 --&gt; /builds/mstredhat/qemu/build/rust/qemu-api/rust-qemu-a=
pi-tests.p/structured/bindings.inc.rs:3840:5<br></blockquote></div></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Acked-by: Paolo Bonzini &lt;<a =
href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt;</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
=C2=A0 =C2=A0 =C2=A0|<br>
3840 | /=C2=A0 =C2=A0 =C2=A0pub fn new_bitfield_1(<br>
3841 | |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0secure: std::os::raw::c_uint,<br>
3842 | |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0space: std::os::raw::c_uint,<br>
3843 | |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user: std::os::raw::c_uint,<br>
...=C2=A0 =C2=A0 |<br>
3848 | |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address_type: std::os::raw::c_uin=
t,<br>
3849 | |=C2=A0 =C2=A0 =C2=A0) -&gt; __BindgenBitfieldUnit&lt;[u8; 4usize]&g=
t; {<br>
=C2=A0 =C2=A0 =C2=A0| |____________________________________________^<br>
=C2=A0 =C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0=3D help: for further information visit <a href=3D"http=
s://rust-lang.github.io/rust-clippy/master/index.html#too_many_arguments" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://rust-lang.github.io/=
rust-clippy/master/index.html#too_many_arguments</a><br>
=C2=A0 =C2=A0 =C2=A0=3D note: `-D clippy::too-many-arguments` implied by `-=
D warnings`<br>
=C2=A0 =C2=A0 =C2=A0=3D help: to override `-D warnings` add `#[allow(clippy=
::too_many_arguments)]`<br>
<br>
Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">mst@redhat.com</a>&gt;<br>
---<br>
=C2=A0rust/qemu-api/src/<a href=3D"http://bindings.rs" rel=3D"noreferrer no=
referrer" target=3D"_blank">bindings.rs</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/rust/qemu-api/src/<a href=3D"http://bindings.rs" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">bindings.rs</a> b/rust/qemu-api/src/<a h=
ref=3D"http://bindings.rs" rel=3D"noreferrer noreferrer" target=3D"_blank">=
bindings.rs</a><br>
index 057de4b646..c4f1f755ce 100644<br>
--- a/rust/qemu-api/src/<a href=3D"http://bindings.rs" rel=3D"noreferrer no=
referrer" target=3D"_blank">bindings.rs</a><br>
+++ b/rust/qemu-api/src/<a href=3D"http://bindings.rs" rel=3D"noreferrer no=
referrer" target=3D"_blank">bindings.rs</a><br>
@@ -13,7 +13,8 @@<br>
=C2=A0 =C2=A0 =C2=A0clippy::missing_const_for_fn,<br>
=C2=A0 =C2=A0 =C2=A0clippy::ptr_offset_with_cast,<br>
=C2=A0 =C2=A0 =C2=A0clippy::useless_transmute,<br>
-=C2=A0 =C2=A0 clippy::missing_safety_doc<br>
+=C2=A0 =C2=A0 clippy::missing_safety_doc,<br>
+=C2=A0 =C2=A0 clippy::too_many_arguments<br>
=C2=A0)]<br>
<br>
=C2=A0//! `bindgen`-generated declarations.<br>
-- <br>
MST<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000a06abd0639f21c08--



Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD3CC83F1A
	for <qemu-rust@archiver.kernel.org>; Thu, 17 Jul 2025 15:28:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ucQXD-0007dp-95; Thu, 17 Jul 2025 11:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ucOV1-0004Xg-4Y
 for qemu-rust@nongnu.org; Thu, 17 Jul 2025 09:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ucOUv-0003hF-14
 for qemu-rust@nongnu.org; Thu, 17 Jul 2025 09:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752758283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=saVOoAaBPzlGE8ivOOCoL9jhD6Hp4gymnmDKeMLNyag=;
 b=as0ssneuSyD6hcOf4mM51t507/CWqAr6aRHvRPb2F/ZVkDQqEhefArcGl9gG62ADNh+lRp
 Xug/2wM6HEGWmELFz0e33NiItmX7tJVWujMq7o5CppBhYl7iC/sDc0vj7OddKwfraql4Ia
 fsrj8cqMPn40mM+7kM5wr0qfM0twjm0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-2FRy_hGqO2ee7vzUzrkrqA-1; Thu, 17 Jul 2025 09:18:01 -0400
X-MC-Unique: 2FRy_hGqO2ee7vzUzrkrqA-1
X-Mimecast-MFC-AGG-ID: 2FRy_hGqO2ee7vzUzrkrqA_1752758281
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-455e918d690so12664885e9.1
 for <qemu-rust@nongnu.org>; Thu, 17 Jul 2025 06:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752758279; x=1753363079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=saVOoAaBPzlGE8ivOOCoL9jhD6Hp4gymnmDKeMLNyag=;
 b=gLtJs8lYjvuGR7TmzLQ777wBFMfr8xcsbDfT01gKK8mVaQBALG5z2esxGYfYQX/FdR
 C+xUrCgQnKaFYEXrfXvs6Us9IxxpHP9FIYS74d+Dzlx5lrN1DLV/F0aroWx60JVhv4OB
 T/8U9hvrZHDz9YHDAp+V8YYkCAiAhhBysJm6P4VOJZ8NJuXH1RVfFwgTrBtUp+HopJy5
 JHn7018uJH0zgByqpPrw04GkFar3a94PeXY9c9QxYp8kuySa9I0bq5SFDqKGGP+D5JEy
 mbazFqvd3pgqHjyEeUtAAmzQek6J3fQ/FO11p8zSVHw+2yeD434t10Ux/Q+0RDjV2rzz
 aguQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGx5C+dmxuEHoSKIvEjVwKjer4auWNCgtgIMzVf7MyBNljb0Tt1VsTLn2lgbJEUpqUQtIbCNmQjek=@nongnu.org
X-Gm-Message-State: AOJu0YyJU2wvJXNO5R8Q3oncD7yw1rs3ndaTNaheFPN2JDkFl43puUMp
 KbMjxYTfdyS7TtxASH0j4fclPVOk9ZWg9yg7NYx91QTXqJZ3OI09rx9vituhLiQmb9oiC0UerO6
 mauGxOyWmdTB+JMzY2aALVECYeGb+VY/gCuONArTvhvonJzDSnRSpGFTLaCciYhI8GCEDBCDwWP
 rIgNxaxnGGri88m0SHAT2vfAm9rPA7Vh2rdQZ+WQ==
X-Gm-Gg: ASbGncs6TPuIwk6iJr28ulXQqnUA+Lhk3ReN2/aM+1+oAsVcYwN8cxtqy88BVIpJJp2
 UgDu9UZ2GN8KCw/d+cNV9TklD40hxCSOMHCraCekXE7gdK5sZPE+nCSp0+95C3K8culVycZjnO9
 iyhzNZ1zAFWDmrNYiFne0=
X-Received: by 2002:a05:6000:2f82:b0:3b6:17a8:60c0 with SMTP id
 ffacd0b85a97d-3b617a8646dmr1187405f8f.25.1752758279218; 
 Thu, 17 Jul 2025 06:17:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCyI0q7dONXjcg7BOL6znD1t9pr8Z9llYXKHEw1eXU3Bsv/l1FmIdLg6kYwSiJPR4REkHyvruJLIMbA2fM/e4=
X-Received: by 2002:a05:6000:2f82:b0:3b6:17a8:60c0 with SMTP id
 ffacd0b85a97d-3b617a8646dmr1187374f8f.25.1752758278693; Thu, 17 Jul 2025
 06:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250717062727.305466-1-pbonzini@redhat.com>
 <CAAjaMXauWy1sk+JkjTRzAf8yA72Xk=Qbt4+yw7XNPfx=q4WTZg@mail.gmail.com>
In-Reply-To: <CAAjaMXauWy1sk+JkjTRzAf8yA72Xk=Qbt4+yw7XNPfx=q4WTZg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Jul 2025 15:17:47 +0200
X-Gm-Features: Ac12FXw2vgLmU20aP5Fc3Vy8ENP9vn-hhCrtJHtPx4kib9-8pJcxMiHHKSde_58
Message-ID: <CABgObfb_7vzL21HNd5MecEM3iHM+LxCJ42D8D7K-OJSQ_p4_kg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] rust: use attrs crate to parse #[property]
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mErMlCMmmS4Su5hbCaik15JhjAOdchqEdIDD8sb3Qg8_1752758281
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000944c3a063a1fd6cb"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

--000000000000944c3a063a1fd6cb
Content-Type: text/plain; charset="UTF-8"

Il gio 17 lug 2025, 11:18 Manos Pitsidianakis <
manos.pitsidianakis@linaro.org> ha scritto:

> Looks OK to me but are we sure it's necessary? This dependency is just
> a syn::parse wrapper under the hood. Even serde's derive macros use
> syn directly:
> https://github.com/serde-rs/serde/blob/babafa54d283fb087fa94f50a2cf82fa9e582a7c/serde_derive/src/internals/attr.rs#L276
>
> I'm not against dependencies mind you, but this replaces just a few
> lines of code.
>

It depends on how many copies of the procedural macros parsing code we have
(hence RFC).

If you introduced a #[device] or #[object] attribute, for example, it
probably would make a lot more sense than for #[property] only. Besides the
shorter code it would also provide more consistent error messages across
the attributes.

For just one macro, what you have now is fine. I did this series mostly to
have it ready and check that attrs respects the same MSRV as QEMU (it
didn't :)).

Paolo



> --
> Manos Pitsidianakis
> Emulation and Virtualization Engineer at Linaro Ltd
>
>

--000000000000944c3a063a1fd6cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 17 lug 2025, 11:18 Manos =
Pitsidianakis &lt;<a href=3D"mailto:manos.pitsidianakis@linaro.org">manos.p=
itsidianakis@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Looks OK to me but are we sure it&#39;s necessa=
ry? This dependency is just<br>
a syn::parse wrapper under the hood. Even serde&#39;s derive macros use<br>
syn directly: <a href=3D"https://github.com/serde-rs/serde/blob/babafa54d28=
3fb087fa94f50a2cf82fa9e582a7c/serde_derive/src/internals/attr.rs#L276" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/serde-rs/se=
rde/blob/babafa54d283fb087fa94f50a2cf82fa9e582a7c/serde_derive/src/internal=
s/attr.rs#L276</a><br>
<br>
I&#39;m not against dependencies mind you, but this replaces just a few<br>
lines of code.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">It depends on how many copies of the procedural macros parsin=
g code we have (hence RFC).</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">If you introduced a #[device] or #[object] attribute, for example, it p=
robably would make a lot more sense than for #[property] only. Besides the =
shorter code it would also provide more consistent error messages across th=
e attributes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">For just o=
ne macro, what you have now is fine. I did this series mostly to have it re=
ady and check that attrs respects the same MSRV as QEMU (it didn&#39;t :)).=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
-- <br>
Manos Pitsidianakis<br>
Emulation and Virtualization Engineer at Linaro Ltd<br>
<br>
</blockquote></div></div></div>

--000000000000944c3a063a1fd6cb--



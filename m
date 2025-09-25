Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71ABCAC5A5
	for <qemu-rust@archiver.kernel.org>; Thu, 25 Sep 2025 09:24:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1iDT-0004ZG-IK; Thu, 25 Sep 2025 05:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v1iDK-0004WO-14
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 05:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v1iDC-0005fb-N6
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 05:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758792263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XIzlyooKYfBMKaG+SItE0Lct9mpx/2Nun5ov9NTDopM=;
 b=Yxp8eMEL+JNikiMTY/40FwMOrQEKXCtLXXW9d4Q0GE2pJkOAu1x0X6nIYeYkCvWQj4cGCu
 HB1CX0+M4LKAXC1PFLImqLI+jU4skG4OjhI92s9rKcVXOWvRikIYVhNVplOkAgZpFyRsFT
 S+3Xc3F8oEv3nnREQTnWYFVboH7Ato0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-qWtSebjoMqGMW3nou4OhOA-1; Thu, 25 Sep 2025 05:24:21 -0400
X-MC-Unique: qWtSebjoMqGMW3nou4OhOA-1
X-Mimecast-MFC-AGG-ID: qWtSebjoMqGMW3nou4OhOA_1758792260
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e1a2a28f4so3763655e9.2
 for <qemu-rust@nongnu.org>; Thu, 25 Sep 2025 02:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758792260; x=1759397060;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XIzlyooKYfBMKaG+SItE0Lct9mpx/2Nun5ov9NTDopM=;
 b=nZshF5UsMxXNEtTUwaueJBpcWQ5nGlacQH9XQHBO71WTKHbyp7/BKsiFqZrfvvk9lY
 c930Ad9LWlQ2Cw+uazYcgvAjnYoQMYCLle/6H4EIfPhPgqBDCLRNcpxhw2QGiAD9ENnw
 1DAmQ0Vtp+ypPbh3NRgu89rNTnbDljidAMfs1qxf7wI6YJS0TmTK9sQJbp253cTehvPl
 RMPKYe4DrGMDHEK2VgUjht1yp6s88Qzm8O8EQcEJkDi7vdzLA6O1+u+3X1hUT+T66ltp
 637cXs6McLeEgl2XeCRVpipT0eFFsfQfBFchjUZRDooFvuPr27sB1SSP/c/B/MZFEcPx
 Z/zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3CGmwdWOe3Ihs8Rjs1JUoXVjiW74WnoNGFVckjToVBpj+nOcLpCi1kSbKoE81nRRJRD4U1fM7A9Y=@nongnu.org
X-Gm-Message-State: AOJu0YyQbJcOZoqU+QuZyc/CcpqRy6KY0UQMg7qwUxc1wPGG7qeg+7ye
 U9je8fychGsu2hm7T2jW2Q0WmkG8V3z1z5ULNgj0BsVs79Zpgtc8qe5DjeH5Yfz00Re5y7QZrW9
 mbzuHwYklQjPJexfOtwUyc/LXkRGu8amAunBYIGZgFqjBOnOz/d+jEEb0cSMA16lsThCeg83mpb
 yRal8f0lNIZenMTo0qRrXsqnSPphal+g==
X-Gm-Gg: ASbGnctVXj5yi/20aLinoOksHn53yzBbaTZBinDGoFTGGLzBiA9MZzUnxAGa2RPWl67
 SLxXR4xiLfo9hn+uRe96kZHTDcPxN1ZRMB8rJRW80o7diPCxd01rujufJyNneWHCm35ocfoQjAp
 y16wb7Bj+VQTgiY8HkEPmS/PghPFp+85xOolPuG0wY19g4RGF8e0K6xxUfzOUWMQAyhnBlFVyW+
 1fSMWHuRtU8uNaPtMaNmbiYaoo=
X-Received: by 2002:a05:6000:2891:b0:3ea:80ec:8552 with SMTP id
 ffacd0b85a97d-40e4ce4bc13mr2590219f8f.57.1758792260222; 
 Thu, 25 Sep 2025 02:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJgf/usCvawS5PXHPHt6zGV4W0M3xrlujXEcSkHuaaB8cJPxQ2fgCj1lV/N3ToRX/tqYN2heNZNW6R1MXujuU=
X-Received: by 2002:a05:6000:2891:b0:3ea:80ec:8552 with SMTP id
 ffacd0b85a97d-40e4ce4bc13mr2590198f8f.57.1758792259889; Thu, 25 Sep 2025
 02:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250920142958.181910-1-pbonzini@redhat.com>
 <20250920142958.181910-4-pbonzini@redhat.com>
 <aNQMekqSqG7DjmPX@intel.com> <aNQN7Nt7jKiA/rn1@intel.com>
In-Reply-To: <aNQN7Nt7jKiA/rn1@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 25 Sep 2025 11:24:09 +0200
X-Gm-Features: AS18NWCU4FKj74qK2SCO8FX2tApPlWeqEgJbYgxqFXNPprvyAiUjB1bbPhE0c3k
Message-ID: <CABgObfYHfdjcitwEOiFf3c24B7T3-PgZhQMQut3UNRQ4hj1eZA@mail.gmail.com>
Subject: Re: [PATCH 3/7] rust: migration: extract vmstate_fields_ref
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZNQVo7TGp2YaOuGGheUidjMdjFvV34ygj8hxOOK2mUk_1758792260
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e2836f063f9cbbd0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--000000000000e2836f063f9cbbd0
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 24, 2025, 17:06 Zhao Liu <zhao1.liu@intel.com> wrote:

> > Considerring the idea about returing &'static [VMStateField], I think at
> > least we could return `_FIELDS.as_ptr()` directly from vmstate_fields!,
>                          ^^^^^^^^^^^^^^^^
> Sorry for copy error :(,  s/_FIELDS.as_ptr()/_FIELDS/
>
> > and convert &'static [VMStateField] to *const [VMStateField] in
> > fields(), just like subsections() did.
>

Yes, that's a good idea. Though subsections() can also be cleaned up a lot
to avoid the wrapper. I will include everything in the next version.

Paolo

>

--000000000000e2836f063f9cbbd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Sep 24, 2025, 17:06 Zhao Liu &lt;<a href=3D"ma=
ilto:zhao1.liu@intel.com" target=3D"_blank" rel=3D"noreferrer">zhao1.liu@in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">&gt; Considerring the idea about returing &amp;&#39;static [VMStateF=
ield], I think at<br>
&gt; least we could return `_FIELDS.as_ptr()` directly from vmstate_fields!=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^<br>
Sorry for copy error :(,=C2=A0 s/_FIELDS.as_ptr()/_FIELDS/<br>
<br>
&gt; and convert &amp;&#39;static [VMStateField] to *const [VMStateField] i=
n<br>
&gt; fields(), just like subsections() did.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Yes, that&#39;s a good idea. Tho=
ugh subsections() can also be cleaned up a lot to avoid the wrapper. I will=
 include everything in the next version.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Paolo</div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div></div>

--000000000000e2836f063f9cbbd0--



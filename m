Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C6FCA0EDB
	for <qemu-rust@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ulubl-0002ZB-8s; Tue, 12 Aug 2025 15:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ulubj-0002YE-Mm
 for qemu-rust@nongnu.org; Tue, 12 Aug 2025 15:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ulubd-0002Ci-4r
 for qemu-rust@nongnu.org; Tue, 12 Aug 2025 15:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755026654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKImHrP7rJsm3IdCfU6xDEZyNnefYkvDAGCXiHl9c+o=;
 b=UBHdEz6Gk9Px2jmE/+7nTZ8jpdYY0KZZslGh9FUEz2e36UvtciII2S184LijQeuevkYuOt
 HjaAnsL9KJZuunnBf4dymV8mrnr5l59++/fVun450xbcBNWCq9+xZeEHLEclAjcUIvslmZ
 1vjPtL8nfrlZ6CGYfHHFT8+uj+3aZJc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-b9aUWnitOcubSwLQP6Phaw-1; Tue, 12 Aug 2025 15:24:11 -0400
X-MC-Unique: b9aUWnitOcubSwLQP6Phaw-1
X-Mimecast-MFC-AGG-ID: b9aUWnitOcubSwLQP6Phaw_1755026651
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-458c0845b34so41117015e9.2
 for <qemu-rust@nongnu.org>; Tue, 12 Aug 2025 12:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755026650; x=1755631450;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HKImHrP7rJsm3IdCfU6xDEZyNnefYkvDAGCXiHl9c+o=;
 b=VEcoE7Umgs7hHwcyP/o0vbUN9eFgC4k1lQichZoESl/yAbUzVm3hdNNC2SAj17V3EU
 x2xjbaXj1VRb72NmL5b93oWylSngjdHcLQTjGHxq8VCHmPCBB5z2J6DJyekfg6+pKacZ
 +/ktlD6Y0jEvH9dZ/KIBds6IoFL5I91ZQtV0E1tAY52ILWUXuPXRbhRcS7MTFdvu7ltR
 QnzFZ+HB+/BNdCCkHPedIElUlPdDPlhdoPMNKxP5ZTS6Lz3iXKPnj/kZfQpZ9PoSL6+4
 8RHFXos19/WucrzKRPO+DtmzFaHQCPpZSp6Uq8uyat4ZMtBE4h2ePBjmsRay4EU60Z2A
 e2Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/gDnHkMTcj5ZNrpN4D1NSTxi9qzHlRa6AshGMJPJEqmbqJ0ZFYQaiVeoDvaGc1ikh/b6TVjxZuPs=@nongnu.org
X-Gm-Message-State: AOJu0Yw6FGU2p/8USt5Z2Zb2gNCTcvxSUeVHAKWnniHW8r6qRf35LxW1
 wvCGyB/sRWQSr4CvbVtWq2egeVgDRAjF4u3jv4W0jHbJkz/lkp7EvLHF3ScepLpMZn1BINaajzY
 T8cCyixBVC5nvalKb/jqaVjwv7MXVfiR6c9cJ4Q7AubAEwS1f5aS/h1qNCjsB/Za179rFzO0ylT
 3id6Ag59GiCKLLEs3bfFhgT3dJztKLCg==
X-Gm-Gg: ASbGnctndjuLoqsPjULT4sg4K/1DyiUUa7He01IwW9pckNsYULvhnCFj1S5DkuQhvXK
 KyTNQHz9RbyVwcPWE5DYllUoGDkYa7UBvAG2AMqSIOe+j6RSJoqlmLl7kabJCFoOdyj2xqYNbwK
 Kc2JMgNa9S0s6jvQCDqlmOUA==
X-Received: by 2002:a05:600c:4746:b0:456:1d61:b0f2 with SMTP id
 5b1f17b1804b1-45a1660068fmr2672055e9.30.1755026650497; 
 Tue, 12 Aug 2025 12:24:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1jz+Gs9cTkQHn3w8eWB+GSgavy76XzmVv1poh3fJoc8yjkRQiFqifKvz4tWc1p4avESqcBynJJc1+euAnhoc=
X-Received: by 2002:a05:600c:4746:b0:456:1d61:b0f2 with SMTP id
 5b1f17b1804b1-45a1660068fmr2671915e9.30.1755026650106; Tue, 12 Aug 2025
 12:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250807123027.2910950-1-zhao1.liu@intel.com>
 <20250807123027.2910950-17-zhao1.liu@intel.com>
 <beab841b-9c69-43d2-b996-879eee9e1120@redhat.com> <aJtgIBgl8JzDsJ1O@intel.com>
In-Reply-To: <aJtgIBgl8JzDsJ1O@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 12 Aug 2025 21:23:59 +0200
X-Gm-Features: Ac12FXy_mKOymcpLosPXpTz7lTsTXHpqKWrXESR-lD6McOr3oVD2bJNVqEdDYK4
Message-ID: <CABgObfbgX3yiBkyc0aH-6WXLf4bdEOgvY=m2AcPQXAXdruSkNQ@mail.gmail.com>
Subject: Re: [RFC 16/26] memory: Make flatview_do_translate() return a pointer
 to MemoryRegionSection
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Junjie Mao <junjie.mao@hotmail.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OfYzDSMlShI7v8yRfWh5YVk8SUmzt2bGB0p_Ts9fVSU_1755026651
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000d1ed2063c2ffc3e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

--0000000000000d1ed2063c2ffc3e
Content-Type: text/plain; charset="UTF-8"

Il mar 12 ago 2025, 17:17 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> But look closer to Opaque<>, it has 2 safe methods: as_mut_ptr() &
> raw_get().
>
> These 2 methods indicate that the T pointed by Qpaque<T> is mutable,
> which has the conflict with the original `*const
> bindings::MemoryRegionSection`.
>
> So from this point, it seems unsafe to use Qpaque<> on this case.
>

Yes, it's similar to NonNull<>. I am not sure that you need Opaque<> here;
since the pointer is const, maybe you can just dereference it to a
&bindings::MemoryRegionSection. Is it useful to have the Opaque<> wrapper
here?

To address this, I think we need:
>  - rich comments about this MemoryRegionSection is actually immuatble.
>  - modify other C functions to accept `const *MemoryRegionSection` as
>    argument.
>

Yes, adding const is useful in this case.

Paolo

What do you think?
>
> Thanks,
> Zhao
>
>

--0000000000000d1ed2063c2ffc3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 12 ago 2025, 17:17 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">But l=
ook closer to Opaque&lt;&gt;, it has 2 safe methods: as_mut_ptr() &amp;<br>
raw_get().<br>
<br>
These 2 methods indicate that the T pointed by Qpaque&lt;T&gt; is mutable,<=
br>
which has the conflict with the original `*const bindings::MemoryRegionSect=
ion`.<br>
<br>
So from this point, it seems unsafe to use Qpaque&lt;&gt; on this case.<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes,=
 it&#39;s similar to NonNull&lt;&gt;. I am not sure that you need Opaque&lt=
;&gt; here; since the pointer is const, maybe you can just dereference it t=
o a &amp;bindings::MemoryRegionSection. Is it useful to have the Opaque&lt;=
&gt; wrapper here?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
To address this, I think we need:<br>
=C2=A0- rich comments about this MemoryRegionSection is actually immuatble.=
<br>
=C2=A0- modify other C functions to accept `const *MemoryRegionSection` as<=
br>
=C2=A0 =C2=A0argument.<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Yes, adding const is useful in this case.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
What do you think?<br>
<br>
Thanks,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--0000000000000d1ed2063c2ffc3e--



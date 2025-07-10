Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52498C83F1B
	for <qemu-rust@archiver.kernel.org>; Thu, 10 Jul 2025 14:33:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uZsKn-0005fF-6R; Thu, 10 Jul 2025 10:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZsEA-0006by-Jb
 for qemu-rust@nongnu.org; Thu, 10 Jul 2025 10:26:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZsE5-00016J-R6
 for qemu-rust@nongnu.org; Thu, 10 Jul 2025 10:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752157576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMhGL/vuYOQ/mTLFpG0ZAX+4A1VXOGLiQClWfQZ1aIs=;
 b=GR/CYuQj1UOX6kMFUGj1lO4amB/vEjVGCjj8kj/idY9jckT4qloe8G0pEALPE3+qFO5giY
 QBqRAUJCANPwCNcEKT8flZy+XyvJ98vPmgHqXxGCXHUpFYd4pYHpAQb1QZCXKcswrfgUvo
 NmzQ/Q+SktNc6ku/svAtcAY/fseffRw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-m05p30eYOAOeGV9DkIfIXA-1; Thu, 10 Jul 2025 10:26:14 -0400
X-MC-Unique: m05p30eYOAOeGV9DkIfIXA-1
X-Mimecast-MFC-AGG-ID: m05p30eYOAOeGV9DkIfIXA_1752157572
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3138c50d2a0so1694697a91.2
 for <qemu-rust@nongnu.org>; Thu, 10 Jul 2025 07:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752157572; x=1752762372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMhGL/vuYOQ/mTLFpG0ZAX+4A1VXOGLiQClWfQZ1aIs=;
 b=w+5x0XpCUyGIbj3l9pNuKDTYcB8trtntOdp7DikSfShf1m0Sw5Rinrq3xY2n2+pggU
 SO4XTN2J5dk25YWf2iJMlYkpXu2fbTBNwcC7tWsk6Os1MJEuer9SxhqUU6kb9zHmI6lA
 mVfhQZaybO5piy2Zk5OHqQ85hOIrBXB5sVvcRyHMiPzT/VvXqp9c3Wu/sKg8KdFm3w0r
 jLW4RtoOOdN7oMYs2ZZrHjmEl541aznLIyBB6Nk/jzNFnNRHho+tHxwnT0+ARDf8jDiU
 bGfN9DxK09WH2et84GQTJ+nmvAYIt5YNiBIL/X1SpC9IbgtwDcQaLMN451PU1af84OgJ
 NA7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDY7P7UGfbGPPELyJ4Zy3u9JgEDCjZexliVacTi927gAtlwgQ4MBEXeTtalgpJPZdmx2OpEoud+Jg=@nongnu.org
X-Gm-Message-State: AOJu0Yx98nV90gOzJ/nv+KeSp5H4o3rtA9w+OgWODGpV65L0O43DQUF/
 hLDiIri7oyfsb66AHyDYjxHIO6YvNXOGJ1jLJg4Tt/xXT3w0AIvUz8Xah+EOpBisLZVpSbRyJab
 bZngxeb3hpdaWslx3lEA4hrJzhzh/mFl2H368E8vHWgwaOZK9TUsuvDKHU0xpRGkYGO/MsyGYgP
 Rz4xJqb6SmlYAis1G4IObdjFtZvROmgA==
X-Gm-Gg: ASbGncu59GsjcB60fBOQ/ywPAZFLRSREYleC5pHtbQbESo/CG+00mOjb/r4vYL12fWC
 02j/1RuUf9PK5p+fZmM2KDR7EW3TnGyfNmpYrw3CQ3+K+4t1RauveAy3nFQC1x1ffZq4/KWxRui
 UfQYAc
X-Received: by 2002:a17:90b:3844:b0:313:23ed:701 with SMTP id
 98e67ed59e1d1-31c2fcc49b5mr10711261a91.4.1752157571879; 
 Thu, 10 Jul 2025 07:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBnGTNKXdMh3rvrTih1z7cubLdmeSOwckFB2X2tX1wfIscaHMC0wYGgPs92JW3kKcShOyuG4hzMgGtWGvwGBU=
X-Received: by 2002:a17:90b:3844:b0:313:23ed:701 with SMTP id
 98e67ed59e1d1-31c2fcc49b5mr10711204a91.4.1752157571370; Thu, 10 Jul 2025
 07:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250703-rust-qdev-properties-v2-1-d4afac766e94@linaro.org>
 <63edd7ca-02b3-416c-ae28-38bd5386aa89@redhat.com>
 <CAAjaMXbdA51QOR0tx4OnbSnWdx9=cjR_GsaMFdAvrVHy9a-XQQ@mail.gmail.com>
In-Reply-To: <CAAjaMXbdA51QOR0tx4OnbSnWdx9=cjR_GsaMFdAvrVHy9a-XQQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 10 Jul 2025 16:25:58 +0200
X-Gm-Features: Ac12FXyjuWi_HGng0Nsq5uQa7-3ebJJG4QsLWgAfrJwHtxiANMlFSfiPFsv04ls
Message-ID: <CABgObfaiM6-n_O-jD5NkT8iD05a-+jfs33hVkb-UsuG8D_TAvQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2] rust: add qdev DeviceProperties derive macro
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WgOSuVVDZt04lldsF7jD9wX4SzOmLCUObP3ErJpiJLg_1752157572
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Thu, Jul 10, 2025 at 11:41=E2=80=AFAM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
> > Aside from that, I actually liked using Device for the macro name in
> > your earlier versions.  Yes, it's just for properties in practice, but
> > it's nice and small to just say Device; and it mimics Object.  It's you=
r
> > choice anyway.
>
> I was thinking of making a `Device` derive macro that lets you also
> define `DeviceImpl::REALIZE` and `DeviceImpl::vmsd` as macro
> attributes on the struct definition, then merge DeviceProperties into
> that. WDYT?

Like #[derive(Device(realize =3D PL011State::realize))]? I kind of like
having traits for classes (the "const" does look a bit ugly/foreign,
but Linux has some other ideas using a #[vtable] procedural macro).

For vmsd yes, you could pass it as a VMStateDescription const's name
in the same style, like #[derive(Device(vmsd =3D
device_class::VMSTATE_PL011))].

WRT naming, I was thinking the other way round: call it Device
already, and then add functionality without having to change the name.
Your choice; naming suggestions are risky :) but I wasn't afraid of
making this suggestion because you had that name before.

> Hm, isn't it redundant if the trait is marked as `unsafe`? Or maybe I
> misunderstood your point.

Yes, you're right - just wanted something not too tied to properties
in case the derive macro is extended later. Maybe DeviceDerive, or
DeviceImplDerive? But any name is fine, just keep it consistent
between macro and trait.

> > > +/// It is the implementer's responsibility to provide a valid [`bind=
ings::PropertyInfo`] pointer
> > > +/// for the trait implementation to be safe.
> > > +pub unsafe trait QDevProp {
> > > +    const VALUE: *const bindings::PropertyInfo;
> >
> > "*const" or "&"?
>
> This is the thing I mentioned to you over IRC: Unfortunately even with
> const refs for statics we get this because the static is extern:

Ah okay - I just wasn't sure, which is why I wrote it as a question.
It worked in vmstate because there the const is a VMStateField which
has a *const inside. So yes, definitely a *const.

Paolo



Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A77FC83F1B
	for <qemu-rust@archiver.kernel.org>; Thu, 10 Jul 2025 16:50:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uZuT1-0006aK-FE; Thu, 10 Jul 2025 12:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZu9Y-0002ud-IB
 for qemu-rust@nongnu.org; Thu, 10 Jul 2025 12:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZu9R-0003os-Rt
 for qemu-rust@nongnu.org; Thu, 10 Jul 2025 12:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZC7zdxlSsFyQWVgmh3dGZUfDCyjhxzt7G1eaJyMKXXA=;
 b=g3IUp+RONv8uawsg3SOwQbnx9x9BxfDxvJKRtFgrslTiwRbccdSOKkMEEpRws4ESHCwbuV
 VSNEnGjS3DoCVMU/3pyIsSRM9M8rM84/TZQgti5Y0D3mybAf6DBx99ZOGF6wsiojEnLSSl
 gUWaCPoxUi130OYXzdhPfyY0ak1mHQM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-K75_QUolN8OD-u5adV442g-1; Thu, 10 Jul 2025 12:29:35 -0400
X-MC-Unique: K75_QUolN8OD-u5adV442g-1
X-Mimecast-MFC-AGG-ID: K75_QUolN8OD-u5adV442g_1752164975
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311ef4fb5fdso1489300a91.1
 for <qemu-rust@nongnu.org>; Thu, 10 Jul 2025 09:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164972; x=1752769772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC7zdxlSsFyQWVgmh3dGZUfDCyjhxzt7G1eaJyMKXXA=;
 b=gPU4TQ2SF3Pqh1bpaZ3WNrOCUIXwJd+N1iiMNX5uynLHzQHbPGLxdvXkSWcJdY/w/h
 ANIAW28/MGiFKpWSi81He994E9eV3XlHbJR2pUEm3A6/h5P8A1od/u+zHuCOgADe4kig
 bEryrFUqdB0Gi999FdLpMgSZ+cNC7BiqqJgsrjOG2lTbXc/huegU1X/9ihDtH92Rl0e1
 sV6oykxt7Y+vQ7KjeDJ2bLhnb0B4dKQWvo58Q/aIe2VRHO+LbYgz5yQYsDkaFML2VGk/
 QdwK7AVTcdMzeSk0puCOKvJGtSXgyOe/nWlJx9Tk/tujXntfcpC6g4cYBG4wTjFFwuef
 5zgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWekEbGRycNllagHykCd5t/sbqxww9Df2nYyJlsfFtnaZdOoj7DIqifKRhtMeF7vlyTwNWwUgpnxIQ=@nongnu.org
X-Gm-Message-State: AOJu0YxbYa9uJLBEyYMXw0J6vj8o/gH4+//l8GKbTIiYHUXrCZ2ImCpZ
 RYZ9gyN0YLedOm1GVv1ataigB4YxWuRW6Empz3EevivtcZaT8YfdBdFaXbQi2dz51Ct68OrDYCI
 840RU6Ke8I/0X6uwILkCRGh5N2g7L2xgv4BKNveBnIMxSK3XDkVSAeG/utJm+tW3f5RCWbXnryi
 RSM3HtLQ0Xba1A30AmWcqLnXiurdc4pe0sDfYDwg==
X-Gm-Gg: ASbGncuXVp9AgBLO+BkGwBjN05ivwNrOxbdNk6+KP+dP6p7/93+TzM9OuvgTGISFRq4
 5KHg87nccINPqy3AftJNAjyCKloIhgyeeRIS7Q+6NuxnThNi2XUt2HBx7DDoV07Xgtna+b6aKNM
 mmJM3z
X-Received: by 2002:a17:90b:4cc5:b0:312:39c1:c9cf with SMTP id
 98e67ed59e1d1-31c4cca45a1mr241994a91.7.1752164972186; 
 Thu, 10 Jul 2025 09:29:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVmPtsEW5+DofQTShJiHBp0Lg0MUabQ7Mdvq7qOKFdsC6qicHzW/f8lRi/ctXN/0RGV7IIbZlcqw0ObX52VXk=
X-Received: by 2002:a17:90b:4cc5:b0:312:39c1:c9cf with SMTP id
 98e67ed59e1d1-31c4cca45a1mr241946a91.7.1752164971757; Thu, 10 Jul 2025
 09:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250703-rust-qdev-properties-v2-1-d4afac766e94@linaro.org>
 <63edd7ca-02b3-416c-ae28-38bd5386aa89@redhat.com>
 <CAAjaMXbdA51QOR0tx4OnbSnWdx9=cjR_GsaMFdAvrVHy9a-XQQ@mail.gmail.com>
 <CABgObfaiM6-n_O-jD5NkT8iD05a-+jfs33hVkb-UsuG8D_TAvQ@mail.gmail.com>
 <CAAjaMXaHVSg7cmV8q5Jazfiw_o=pu6KmHj7SnSeoJzzStNd+4g@mail.gmail.com>
In-Reply-To: <CAAjaMXaHVSg7cmV8q5Jazfiw_o=pu6KmHj7SnSeoJzzStNd+4g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 10 Jul 2025 18:29:19 +0200
X-Gm-Features: Ac12FXx6Lmfq38n4o5mMTKl1elWXxv6VVq1nJgTuuX20q3KGmCfIqGMJVmBmIv0
Message-ID: <CABgObfYoqFkzgurUvt0aG4RFp=-h_pirYiaaWU9ybtU8GrD-bQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2] rust: add qdev DeviceProperties derive macro
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QcxiZaYYof5UyEbKTCEov73ihVcYEW_lyaM4VIIOsg4_1752164975
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Thu, Jul 10, 2025 at 4:48=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> On Thu, Jul 10, 2025 at 5:26=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.co=
m> wrote:
> >
> > On Thu, Jul 10, 2025 at 11:41=E2=80=AFAM Manos Pitsidianakis
> > <manos.pitsidianakis@linaro.org> wrote:
> > > > Aside from that, I actually liked using Device for the macro name i=
n
> > > > your earlier versions.  Yes, it's just for properties in practice, =
but
> > > > it's nice and small to just say Device; and it mimics Object.  It's=
 your
> > > > choice anyway.
> > >
> > > I was thinking of making a `Device` derive macro that lets you also
> > > define `DeviceImpl::REALIZE` and `DeviceImpl::vmsd` as macro
> > > attributes on the struct definition, then merge DeviceProperties into
> > > that. WDYT?
> >
> > Like #[derive(Device(realize =3D PL011State::realize))]? I kind of like
> > having traits for classes (the "const" does look a bit ugly/foreign,
> > but Linux has some other ideas using a #[vtable] procedural macro).
>
> I was thinking:
>
> #[repr(C)]
> #[derive(Device)]
> #[device(realize =3D PL011State::realize, vmsd =3D VMSTATE_PL011)]
> pub struct PL011State {
>   ..
> }
>
> I agree about traits for class methods, it's definitely cleaner. The
> lines blur here because we have REALIZE as a constant in order to make
> it nullable from the C side =F0=9F=A4=94

Yes, I agree. Another factor to consider is the quality of error messages.

For what it's worth, this is the solution they use in Linux:
https://rust-for-linux.github.io/docs/macros/attr.vtable.html. In
short, they generate a HAS_REALIZE boolean const, and compute the
function pointer with something like
  if Self::HAS_REALIZE { Some(Self::realize) } else { None }

Forgetting the #[vtable] attribute on the "impl" produces a decent
error message, too.

And here is the source:
https://rust-for-linux.github.io/docs/src/macros/vtable.rs.html. Linux
doesn't use proc_macro2 or quote so probably it would have to be
rewritten for QEMU, but it's small and easy to understand.

Even if it's *also* not the nicest, it may be worth adopting this
convention just for consistency among mixed C/Rust programs.

Paolo


Paolo



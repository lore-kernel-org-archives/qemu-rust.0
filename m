Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAC2CCF9E0
	for <qemu-rust@archiver.kernel.org>; Tue, 28 Oct 2025 11:29:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vDhst-0002qY-Pw; Tue, 28 Oct 2025 07:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDhss-0002q6-8P
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 07:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDhsl-0003jr-O2
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 07:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761650932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHIkPmibtwStN22OEjXI0V2cNbpyBUXkzByUfMmxahc=;
 b=DiqS8mFs5ogmRbflkHgAy7G0Vx06yAWt+DWOVpGd4SzyEydobTqKb5jmuwU2KfyecunBqT
 vqi7h1qv1ACr9TS+KcM+loAKk71lR5xoVW0uekgxnE8whHOVm4R9QglugkGzJCiT9MXmGX
 YCDwrDm2o2QzCSKuonmjV/Q/lguX99s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-psfGNbumOMiEP7zrVSHAMQ-1; Tue, 28 Oct 2025 07:28:51 -0400
X-MC-Unique: psfGNbumOMiEP7zrVSHAMQ-1
X-Mimecast-MFC-AGG-ID: psfGNbumOMiEP7zrVSHAMQ_1761650930
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42700099ff5so6116574f8f.2
 for <qemu-rust@nongnu.org>; Tue, 28 Oct 2025 04:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761650930; x=1762255730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHIkPmibtwStN22OEjXI0V2cNbpyBUXkzByUfMmxahc=;
 b=f3OCoeGnGydA5eZ2cyCaj4sZN0ngN5g4K5WJ7FtkQO8TxYnbi2bMC+3wJTygQjPP74
 4W0UCcuwYIM57HIC4RUEc3XAN2z23lO4oH9gG6MzogVtRvfb2w8H6RtQJn0myjWLdsSZ
 nyc5kGTqPeh4ybILHwIb0rNo1zmihnWNNju9k0ZUH70bcUcIlLp1vkp5ePd1uVd+mJP8
 myw20xKFGVPzdNux/rNboyj5TsufYocmpo3y1zlmxQ/aKhRGld6ZtPUplJqO6qm2T4jK
 +WBytWg2YOedTFj5qj/tjqiNBqK6CKse22axdo8qAI1iBxxdJebREJk+kXXxLmEl7zgB
 +l9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8DfemjrJKznzr66GCSlj0gCa488IgFcXm4gdkL9n1x4YmVK8ZdCY3yQgDApk8r5DbVFoxhtq57Ak=@nongnu.org
X-Gm-Message-State: AOJu0YzG3Sf/NEFjrmoEVj8LOM7wwRHkjB37fBj4RhnZnXSXCWegBBj+
 5fFAqzV2IupTZJSmtZ7jZ7nG94rBFTgQ+Xs56thdPJK3WewrSxvPGVClVAEUWpnp29ms73Y54Ho
 uqSpQU0cPBuKySiF64uD9/R4zeiNep18VZu65odjitp7WVKVRUJa2g9U7gxYUE/uX2TzPkHMjve
 +YL0b47Vdos9pNwc1M+GsRacBtOpSkXA==
X-Gm-Gg: ASbGncvyiXbylPY6gr0GuFlbcXLXt1Cv2GmxyACQfei6KSMfhUxSnhepNnoin9+uy/8
 mWvS9HjXudidprFd/UDUiVYlVkc7JQOBpL+jHCK1V7hvFhpw6ca13cu1q61QlpKsRu0YjxjuI++
 +O/gO0saT+y9VkqTtJE0Gh3cdk+PfQwYIa6MINVRHhSY3EAgg9RNsUV5CfYGLfxCA5lQJnU/OXk
 lV4WltZg8uef6G458YU06N0BcyZne4gKNPPe7B8W6C19Hc5pzEiFsUGj8fE
X-Received: by 2002:a5d:5f94:0:b0:425:7406:d298 with SMTP id
 ffacd0b85a97d-429a7e35cf6mr3344366f8f.5.1761650929900; 
 Tue, 28 Oct 2025 04:28:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuLhOoG7p7dNcptWEv8psw5Y9KKpqGHu0MMUmgiLFzkj/7E/dVHul0xgQAU9S8SOvuI20rHlavxHoouTbzFM0=
X-Received: by 2002:a5d:5f94:0:b0:425:7406:d298 with SMTP id
 ffacd0b85a97d-429a7e35cf6mr3344337f8f.5.1761650929519; Tue, 28 Oct 2025
 04:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <db9abfc03f0dbc953ef314ff7f13ff19298efa7d.1761644606.git.chenmiao@openatom.club>
 <CABgObfaBbf9Hq7RRLkhsa5n0-J+boe1T4guEakOEXDHFrc=4AQ@mail.gmail.com>
 <c1d55488-71e2-498f-a845-d8a336c46f07@openatom.club>
In-Reply-To: <c1d55488-71e2-498f-a845-d8a336c46f07@openatom.club>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Oct 2025 12:28:35 +0100
X-Gm-Features: AWmQ_bmKe4jB2VpFgrvi05USuxtVXHc_MRiuBnzhwWqFITPGp6L5PeM1JFNI-W4
Message-ID: <CABgObfYbJ0jmnRkM=R9JN_SYZx1ybYxt3Y7dxDx0oJFG5BNf6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] rust/hw/core: Add rust bindings/funcs for i2c
 bus
To: Chen Miao <chenmiao@openatom.club>
Cc: zhao1.liu@intel.com, manos.pitsidianakis@linaro.org, 
 richard.henderson@linaro.org, philmd@linaro.org, chao.liu@openatom.club, 
 qemu-rust@nongnu.org, qemu-devel@nongnu.org, 
 hust-os-kernel-patches@googlegroups.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bZZMR-Uip09vWIa6GojbuwdhoI9bCV9tDlf7ziv9iTw_1761650930
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 28, 2025 at 12:18=E2=80=AFPM Chen Miao <chenmiao@openatom.club>=
 wrote:
>
> On 10/28/2025 6:45 PM, Paolo Bonzini wrote:
> > On Tue, Oct 28, 2025 at 11:18=E2=80=AFAM chenmiao <chenmiao@openatom.cl=
ub> wrote:
> >> During the implementation process, we found that the current two parad=
igms in
> >> Rust =E2=80=94 bindings and impl =E2=80=94 are extremely complex and l=
ack comprehensive
> >> documentation. There is no clear explanation as to why Bus and Device =
models
> >> need to be implemented using different approaches.
> > I don't think they need to be implemented using different approaches.
> > The difference between the two is that:
> >
> > - the currently implemented devices do not expose any bus, they stay
> > on a bus. This means the bus is never a child of the device
> >
> > - the currently implemented buses are all in C code, whereas there are
> > devices implemented in Rust.
> >
> > I agree that the Rust-to-C bridge code is complex, but it does have
> > documentation, much more so than the C versions in fact.  If there are
> > specific aspects of the documentation that you would like to see
> > improved, you can help by explaining what problems and sources of
> > confusion you encountered.
>
> That makes sense to me. Since buses are mainly implemented in C, the curr=
ent
> focus of Rust is on porting the device layer. Rust-implemented devices ar=
e
> consumers and do not create any child objects.
>
> I think our previous confusion stemmed from the assumption that Rust was
> porting the entire hierarchy, when in fact Rust is currently only impleme=
nting
> the device layer.
>
> >> +/// A safe wrapper around [`bindings::I2CBus`].
> >> +#[repr(transparent)]
> >> +#[derive(Debug, common::Wrapper)]
> >> +pub struct I2CBus(Opaque<bindings::I2CBus>);
> >> +
> >> +unsafe impl Send for I2CBus {}
> >> +unsafe impl Sync for I2CBus {}
> >> +
> >> +unsafe impl ObjectType for I2CBus {
> >> +    type Class =3D BusClass;
> >> +    const TYPE_NAME: &'static CStr =3D
> >> +        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_I=
2C_BUS) };
> >> +}
> >> +
> >> +qom_isa!(I2CBus: BusState, Object);
> >> +
> >> +// TODO: add virtual methods
> >> +pub trait I2CBusImpl: DeviceImpl + IsA<I2CBus> {}
> >> +/// Trait for methods of [`I2CBus`] and its subclasses.
> >> +pub trait I2CBusMethods: ObjectDeref
> >> +where
> >> +    Self::Target: IsA<I2CBus>
> >
> > There are no virtual methods, and therefore I2CBus does not have
> > subclasses.  Therefore you don't need these traits and you can
> > implement the functions directly on I2CBus.
>
> For this part, we directly referred to the implementation of SysBus.

I see. The difference is that:

- in sysbus there are virtual methods, but Rust does not let you override t=
hem

- in I2C there are no virtual methods added (and in fact you have
"type Class =3D BusClass").

> I'll revise all the points you have raised later.

Thank you!

Paolo



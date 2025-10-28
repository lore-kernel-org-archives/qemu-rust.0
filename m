Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A053CCF9E0
	for <qemu-rust@archiver.kernel.org>; Tue, 28 Oct 2025 12:14:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vDiat-0007Hw-WE; Tue, 28 Oct 2025 08:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDias-0007GY-R6
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 08:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDiao-00025F-5t
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 08:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761653660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tPyco0R/k1vj9XNgWRJiAwpxKnKDTUE0dzRZuvRo24=;
 b=bGJ6DxCc1kWiJnuwehEjXBtJcS37Jpaa0WlhRYhCry8bybgvQyoZNWamhv+i66YZg0dEse
 XKBzDEj/u1jB8RtxYHZCvhAqMqXSxjLVfjYbIY8vdbWaZaIplRb+NDUlyi0baSsU1iXdhe
 y8y2T5w6NhGoSGT/OWi4nwtDZzzTMao=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-Ijcd25KwOji8Efn7o1SnKQ-1; Tue, 28 Oct 2025 08:14:19 -0400
X-MC-Unique: Ijcd25KwOji8Efn7o1SnKQ-1
X-Mimecast-MFC-AGG-ID: Ijcd25KwOji8Efn7o1SnKQ_1761653655
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42700099ff5so6162341f8f.2
 for <qemu-rust@nongnu.org>; Tue, 28 Oct 2025 05:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761653655; x=1762258455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9tPyco0R/k1vj9XNgWRJiAwpxKnKDTUE0dzRZuvRo24=;
 b=WUG1ZhabnHXZ6ZjWk5oBOuyBiOIYHTakLOgOkn9TMnFr5njtDTDury8crWO+bkwgU5
 S5r9CN1GlE8E/If9jAs9jUiaZTkDNRtCzav5gzvnDqoicPtTwx+73W4JPOxwzy4F8rAp
 83v4M14ATLmu7gurXdm6dh/7jkZqgzxkmP47V8Rx/oVD97MuKcO1+cwqEvSOoS1jEdWl
 H9FyPdCoCWz3S13DGiOY9W7ObQJ6jpS9oBmcwphOS5JO+lpJC94wsSPW1mtAOKDF8knh
 0CSzmNAuIGF0jlFFhdp7NUWoT/e5N5fEcVAj5uJvtej5EiowPvtTG7NPMcTcDMDwH/5J
 OxsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9O7r9G0t5WNDXUQPKb0McALjPhxXODlmOX8+8zCkGkIct+5yVFGYztP9UdRgcdhwIjKdlDIWfM/M=@nongnu.org
X-Gm-Message-State: AOJu0YxpaS1QXsekWmtLSxBc3X+RLYxXY4sgkLPABh+rCHFMy0H5PL1A
 MjJWYoQZr8v4epdyNw2ZLQDxQuA1sSde8YxPNfJwyNOhfjeUEVy3nujeEgey6c5+kyOReMrZikd
 IKk/6Nt/D1cA8WDK1vljP00eDmWpQD9kvaKMU+F8uV4bDH1zQ7u/UcHFs5L8A5Bf0+h8ul1A6l9
 gRBWziQyCua+SHHYR564EnNeDqlNJjnw==
X-Gm-Gg: ASbGncs28s5oIAZz/ja1ONhPN8v64v0CWRIezhLaylQonrYTibV1xz12YwUD973NAQq
 ionmAxntfVDtSrDEXLFWYxGY62df0msDOQmTUgZH6OqlmTePABLFytYt0yvzTDxbeM1oBhOs3c6
 hrlR0vjZT6VDEMCoYhQheXMkJ0Me6TTX9rYgRY8kfULsh7D9nJg2h1qAO6GWdRAH5PpwG1qXghX
 KgsdW5RZcPPmXnxabD76lFAou449Uo87m3i8UV6qEF+/Z95kn8IpAeAZ0do
X-Received: by 2002:a05:6000:2507:b0:428:3c4f:2c40 with SMTP id
 ffacd0b85a97d-429a7e869a6mr2512450f8f.56.1761653655205; 
 Tue, 28 Oct 2025 05:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGGPZMaQa5rxPh1/SlJCB9w7tNK0TS858rR01tn+JoFlt7Lm/VzvKmKQK9oy9h7kdacjDFgnC9Y1t2xzSaYTs=
X-Received: by 2002:a05:6000:2507:b0:428:3c4f:2c40 with SMTP id
 ffacd0b85a97d-429a7e869a6mr2512416f8f.56.1761653654688; Tue, 28 Oct 2025
 05:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <ec836b4e6e7521806eba90c4218593c144b103a7.1761644606.git.chenmiao@openatom.club>
 <CABgObfYiUkoS=0f603T-Aqs732j+2_VqopvgRFe-4Q6DJbrK-g@mail.gmail.com>
In-Reply-To: <CABgObfYiUkoS=0f603T-Aqs732j+2_VqopvgRFe-4Q6DJbrK-g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Oct 2025 13:14:01 +0100
X-Gm-Features: AWmQ_bm51gNFv1rCNMofy7m2Dz5YBiCmkNCWSxV3SUTGW0NxhrYWODwoPsokur4
Message-ID: <CABgObfZLCMEqvFyT+SL=_8tJRvcj6+XX8Yd4ZgLuToO45Siv0g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] rust/hw/gpio: Add the the first gpio device
 pcf8574
To: chenmiao <chenmiao@openatom.club>
Cc: zhao1.liu@intel.com, manos.pitsidianakis@linaro.org, 
 richard.henderson@linaro.org, philmd@linaro.org, chao.liu@openatom.club, 
 qemu-rust@nongnu.org, qemu-devel@nongnu.org, 
 hust-os-kernel-patches@googlegroups.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g4YBWgLsMocZl0kKBEiZOIWdAKDUMMQjv9fdbUtLIss_1761653655
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Oct 28, 2025 at 12:26=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> If you were implementing a new serial device, for example, you would
> just write a new directory in rust/hw/char.
>
> Even in that case, creating the meson.build file is more complex than
> in C; I'm working on simplifying that by adding new features to Meson.
>
> In other words, you're not wrong at all but note that you are not

Very important typo: you are *now* seeing the code from the point of
view of someone implementing the Rust-to-C bridges.

Paolo

> seeing the code from the point of view of someone implementing the
> Rust-to-C bridges, not someone implementing a new device, because
> there are no I2C devices yet in QEMU that are written in Rust. I agree
> that this is a relatively large work, on the other it only has to be
> done once.
>
> > Moreover, the mechanisms of bindings and wrappers are overly redundant,=
 and
> > there is no clear indication that they are mandatory. These constructs =
generate
> > a large number of similar structures in the final compilation artifacts=
. Could
> > we design a more generic approach to bindings and wrappers?
>
> Bindings are redundant across crates, indeed. It is probably possible
> to improve how they work.
>
> > Additionally, vmstate has not been fully implemented for the PCF8574 (t=
o be
> > precise, it is not yet complete). During the implementation, I encounte=
red an
> > issue: initially, I tried to directly transliterate the C struct =E2=80=
=94 that is, I
> > attempted to configure vmstate and handle other aspects directly via fi=
eld
> > mappings. However, I eventually found that some internal APIs were inco=
mpatible.
> > To make it work, I had to isolate those "potentially mutable values" in=
to a
> > separate structure, akin to something like a "PL011Register", in order =
for it
> > to function correctly.
>
> This is correct and intended. It isolates the interior-mutable parts
> of the struct and in the future it can be used to support
> multi-threaded devices too.
>
> > +// impl_vmstate_struct!(
> > +//     I2CSlave,
> > +//     VMStateDescriptionBuilder::<I2CSlave>::new()
> > +//         .name(c"I2CSlave")
> > +//         .version_id(1)
> > +//         .minimum_version_id(1)
> > +//         .post_load(&I2CSlave::post_load)
> > +//         .fields(vmstate_fields! {
> > +//             vmstate_of!(I2CSlave, address),
> > +//         })
> > +//         .build()
> > +// );
>
> This is not needed, instead you can implement VMState for I2CSlave:
>
> impl_vmstate_c_struct!(I2CSlave, bindings::vmstate_i2c_slave);
>
> > +bilge =3D { version =3D "0.2.0" }
> > +bilge-impl =3D { version =3D "0.2.0" }
> > +chardev =3D { path =3D "../../../chardev" }
>
> You don't need these.
>
> > +_libpcf8574_bindings_inc_rs =3D rust.bindgen(
> > +  input: 'wrapper.h',
> > +  dependencies: common_ss.all_dependencies(),
> > +  output: 'bindings.inc.rs',
> > +  include_directories: bindings_incdir,
> > +  bindgen_version: ['>=3D0.60.0'],
> > +  args: bindgen_args_common,
> > +  c_args: bindgen_c_args,
> > +)
>
> You also don't need bindgen for this simple device...
>
> > +_libpcf8574_rs =3D static_library(
> > +  'pcf8574',
> > +  structured_sources(
> > +    [
> > +      'src/lib.rs',
> > +      'src/bindings.rs',
> > +      'src/device.rs',
> > +    ],
> > +    {'.' : _libpcf8574_bindings_inc_rs},
>
> ... and therefore you don't need structured_sources, just 'src/lib.rs'.
>
> > +    bilge_rs,
> > +    bilge_impl_rs,
> > +    chardev_rs,
>
> Also remove unneeded crates from here.
>
> > --- /dev/null
> > +++ b/rust/hw/gpio/pcf8574/src/device.rs
> > @@ -0,0 +1,180 @@
> > +// Copyright 2025 HUST OpenAtom Open Source Club.
> > +// Author(s): Chen Miao <chenmiao@openatom.club>
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +use std::slice::from_ref;
> > +
> > +// use common::static_assert;
> > +use bql::BqlRefCell;
> > +use hwcore::{
> > +    bindings, DeviceClass, DeviceImpl, DeviceMethods, DeviceState, I2C=
Slave, I2CSlaveImpl,
> > +    InterruptSource, ResetType, ResettablePhasesImpl,
> > +};
> > +use migration::{
> > +    self, impl_vmstate_struct, vmstate_fields, vmstate_of, VMStateDesc=
ription,
> > +    VMStateDescriptionBuilder,
> > +};
> > +use qom::{qom_isa, IsA, Object, ObjectImpl, ObjectType, ParentField};
> > +use util::Result;
> > +
> > +const PORTS_COUNT: usize =3D 8;
> > +
> > +#[repr(C)]
> > +#[derive(Debug, Default)]
> > +pub struct PCF8574StateInner {
> > +    pub lastrq: u8,
> > +    pub input: u8,
> > +    pub output: u8,
> > +}
>
> This is small and simple enough that it can be Copy.
>
> > +#[repr(C)]
> > +#[derive(qom::Object, hwcore::Device)]
> > +pub struct PCF8574State {
> > +    pub parent_obj: ParentField<I2CSlave>,
> > +    pub inner: BqlRefCell<PCF8574StateInner>,
> > +    pub handler: [InterruptSource; PORTS_COUNT],
> > +    pub intrq: InterruptSource,
> > +}
> > +
> > +// static_assert!(size_of::<PCF8574State>() <=3D size_of::<crate::bind=
ings::PCF8574State>());
> > +
> > +qom_isa!(PCF8574State: I2CSlave, DeviceState, Object);
> > +
> > +#[allow(dead_code)]
> > +trait PCF8574Impl: I2CSlaveImpl + IsA<PCF8574State> {}
> > +
> > +unsafe impl ObjectType for PCF8574State {
> > +    type Class =3D DeviceClass;
> > +    const TYPE_NAME: &'static std::ffi::CStr =3D crate::TYPE_PCF8574;
> > +}
> > +
> > +impl PCF8574Impl for PCF8574State {}
> > +
> > +impl ObjectImpl for PCF8574State {
> > +    type ParentType =3D I2CSlave;
> > +    const CLASS_INIT: fn(&mut Self::Class) =3D Self::Class::class_init=
::<Self>;
> > +}
> > +
> > +impl DeviceImpl for PCF8574State {
> > +    const VMSTATE: Option<migration::VMStateDescription<Self>> =3D Som=
e(VMSTATE_PCF8574);
> > +    const REALIZE: Option<fn(&Self) -> util::Result<()>> =3D Some(Self=
::realize);
> > +}
> > +
> > +impl ResettablePhasesImpl for PCF8574State {
> > +    const HOLD: Option<fn(&Self, ResetType)> =3D Some(Self::reset_hold=
);
> > +}
> > +
> > +impl I2CSlaveImpl for PCF8574State {
> > +    const SEND: Option<fn(&Self, data: u8) -> util::Result<bool>> =3D =
Some(Self::send);
> > +    const RECV: Option<fn(&Self) -> util::Result<bool>> =3D Some(Self:=
:recv);
> > +    const SEND_ASYNC: Option<fn(&Self, data: u8)> =3D None;
> > +    const EVENT: Option<fn(&Self, event: hwcore::I2CEvent) -> util::Re=
sult<hwcore::I2CEvent>> =3D
> > +        None;
> > +    const MATCH_AND_ADD: Option<
> > +        fn(
> > +            &Self,
> > +            address: u8,
> > +            broadcast: bool,
> > +            current_devs: *mut bindings::I2CNodeList,
> > +        ) -> Result<bool>,
> > +    > =3D None;
>
> You don't need to redeclare the ones that are "None".
>
> > +}
> > +
> > +impl PCF8574State {
> > +    fn send(&self, data: u8) -> Result<bool> {
> > +        let prev =3D self.line_state();
> > +        self.inner.borrow_mut().output =3D data;
>
> I think you can use a function like
>
> impl PCF8574Inner {
>     pub fn line_state(&self) {
>          self.input & self.output
>     }
>
>     pub fn set_outputs(&mut self, data: u32) -> PCF8574Inner {
>          let prev =3D self.line_state();
>          self.output =3D data;
>          let actual =3D self.line_state();
>          self
>      }
> }
>
> by making PCF8574Inner "Copy". This removes a lot of the borrows you need=
 below.
>
> > +        let actual =3D self.line_state();
> > +
> > +        let mut diff =3D actual ^ prev;
> > +        while diff !=3D 0 {
> > +            let line =3D diff.trailing_zeros() as u8;
> > +            if let Some(handler) =3D self.handler.get(line as usize) {
> > +                if handler.get() {
> > +                    handler.set((actual >> line) & 1 =3D=3D 1);
> > +                }
>
> There's no need to check if a GPIO line is connected, InterruptSource
> handles it. (This can also be changed in the C version).
>
> > +    fn recv(&self) -> Result<bool> {
> > +        let line_state =3D self.line_state();
> > +        if self.inner.borrow().lastrq !=3D line_state {
> > +            self.inner.borrow_mut().lastrq =3D line_state;
>
> Same here, part of the logic can be moved to PCF8574Inner:
>
>     pub fn receive(&mut self, data: u32) -> (bool, u32) {
>          let prev =3D self.lastrq;
>          let actual =3D self.line_state();
>          self.lastrq =3D actual;
>          (prev !=3D actual, actual)
>      }
>
> The second element of the tuple is needed because...
>
> > +            if self.intrq.get() {
> > +                self.intrq.raise();
> > +            }
> > +        }
> > +
> > +        Ok(true)
>
> ... RECV should return a byte, not a bool.
>
> > +    }
> > +
> > +    fn realize(&self) -> util::Result<()> {
> > +        self.init_gpio_in(self.handler_size(), PCF8574State::gpio_set)=
;
> > +        self.init_gpio_out(from_ref(&self.handler[0]));
> > +        self.init_gpio_out_named(from_ref(&self.intrq), "nINT", 1);
> > +        Ok(())
> > +        // unsafe {
> > +        //   bindings::qdev_init_gpio_in(addr_of_mut!(*self), Self::gp=
io_set, Self::handler_size as c_int);
> > +        //   bindings::qdev_init_gpio_out(addr_of_mut!(*self), Interru=
ptSource::slice_as_ptr(self.handler), Self::handler_size as c_int);
> > +        //   bindings::qdev_init_gpio_out_named(addr_of_mut!(*self), s=
elf.intrq, c"nINT", 1);
> > +        // }
> > +    }
> > +
> > +    fn gpio_set(&self, line: u32, level: u32) {
> > +        assert!(line < self.handler_size());
> > +
> > +        match level {
> > +            0 =3D> self.inner.borrow_mut().input &=3D !(1 << line),
> > +            _ =3D> self.inner.borrow_mut().input |=3D 1 << line,
> > +        }
>
> Again, move this to PCF8574Inner. deposit is in
> common::bitops::IntegerExt and lets you write this:
>
>     pub fn set_input(&mut self, n: u32, value: u32) -> bool {
>          self.input =3D self.input.deposit(n, 1, value);
>          self.line_state() !=3D self.lastrq
>      }
>
> > +        if self.line_state() !=3D self.inner.borrow().lastrq && self.i=
ntrq.get() {
> > +            self.intrq.raise();
> > +        }
> > +    }
> > +
> > +    fn handler_size(&self) -> u32 {
> > +        self.handler.len() as u32
> > +    }
> > +!(
> > +    fn line_state(&self) -> u8 {
> > +        let inner =3D self.inner.borrow();
> > +        inner.input & inner.output
> > +    }
> > +
> > +    fn reset_hold(&self, _type: ResetType) {}
>
> This should clear PCF8574Inner (it can be another method in there).
>
> > +}
> > +
> > +impl_vmstate_struct!(
> > +    PCF8574StateInner,
> > +    VMStateDescriptionBuilder::<PCF8574StateInner>::new()
> > +        .name(c"pcf8574/inner")
> > +        .version_id(0)
> > +        .minimum_version_id(0)
> > +        .fields(vmstate_fields! {
> > +            vmstate_of!(PCF8574StateInner, lastrq),
> > +            vmstate_of!(PCF8574StateInner, input),
> > +            vmstate_of!(PCF8574StateInner, output),
> > +        })
> > +        .build()
> > +);
> > +
> > +pub const VMSTATE_PCF8574: VMStateDescription<PCF8574State> =3D
> > +    VMStateDescriptionBuilder::<PCF8574State>::new()
> > +        .name(c"pcf8574")
> > +        .version_id(0)
> > +        .minimum_version_id(0)
> > +        .fields(vmstate_fields! {
> > +            // TODO
> > +            // vmstate_of!(PCF8574State, parent_obj),
>
> You're right, for this to work you'll need to add
>
> impl_vmstate_transparent!(ParentField<T> where T: VMState);
>
> to rust/qom/src/qom.rs and
>
> impl_vmstate_transparent!(std::mem::ManuallyDrop<T> where T: VMState);
>
> to rust/migration/src/vmstate.rs.  I'll send a patch for this.
>
> But really -- not a bad job at all!  Thanks very much for trying,
> remember that Zhao and Manos and myself have been working on this for
> over a year.  Your experience and your suggestions will be precious,
> so please let us know what can be done better.
>
> Paolo



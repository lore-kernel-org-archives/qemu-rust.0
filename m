Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B66CCD1BF
	for <qemu-rust@archiver.kernel.org>; Tue, 28 Oct 2025 11:26:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vDhqQ-0001ol-MU; Tue, 28 Oct 2025 07:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDhqP-0001o9-3C
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 07:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDhqJ-0003eI-9i
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 07:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761650777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h99UIx5QtsAkeo10J4yO7C3UC8A9Nc8x78UnujJz3tc=;
 b=LvfzhrPSY6lLim5ydS5Bx4sqvatKxlCWr2WjCd7fugVaXT6J8y5+UERNgrM2mTiexVYO2l
 KF/qgUlKuXL2TGw6fTGePVKg9RYdqLqWD/ev6m/H3ln3rbdcoHA6q5loI+qWBN0RO2klBj
 A4l4FBr2kL2mxz5+9dIaTK67NvfPggo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-8k0gznCfNNqP1869eBUtyQ-1; Tue, 28 Oct 2025 07:26:16 -0400
X-MC-Unique: 8k0gznCfNNqP1869eBUtyQ-1
X-Mimecast-MFC-AGG-ID: 8k0gznCfNNqP1869eBUtyQ_1761650775
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4256fae4b46so4659602f8f.0
 for <qemu-rust@nongnu.org>; Tue, 28 Oct 2025 04:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761650775; x=1762255575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h99UIx5QtsAkeo10J4yO7C3UC8A9Nc8x78UnujJz3tc=;
 b=CDRyhvR1EbtWbDgBpUhhfPkFaSklWWPimYD1IkGF4VtpAHvKYe2HYRDpKwiYu39Teo
 kcCe4EGPmelCww8Rhy71Jq0rtROVPbvX+zG0bFz6tA+x+AtJTGPV0CGvvt9/HURFFxVC
 vLVnRoiiXoKLoljbNB8IWRTOJ+N//ShevAIKH7uLuiTrUJnr/mt+ZbdDzEXL3445tMPP
 igb6VIeIxWIDiSP6rmzHK7gt+RgTz+3UYUz4XG0n5wKwC/6++cvbKFQqRBQGOucOSZ93
 fW43RXl0J3Tz/kZOOO5Jij/PR6X0Yvj9LgC9HYdSS5l94A0n7Ap1JA4oAM0rLx+o/TWP
 yCXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXg6z2GQNFHQ0bMLMujDJL724DA4d+mqAaLKf34ZApVso0Srr2nqaK8jGcC8b3Ogg27oLXDLTwSJ4=@nongnu.org
X-Gm-Message-State: AOJu0Yzc+yAg8u2Y7qvAg32Iv39zw8GAU62XFDVHTq+bnmOa+BWCnlfI
 TQNZgt2trsFZe2uPhVbUyfpSlKjcU76rYceu2mRHh9D+EVRG5wBinw8T5PJ2A1YGmHbF7Fga3PZ
 cgJyVLPu0SvNHsjncFlzd5kdcTMoKzEzPlZHbHZ9xLdngM+kEbcIlwM3k8bdegvOhTC9xJ+nkRt
 Ad6TNF2bjf+rYjtleFLDkMQLdb3u7jJg==
X-Gm-Gg: ASbGncvZ5N08zZ5QtPoIE/oPbHHg2qiNpjvYuhk7TDNmaHe7i+v7RUXHa4CJZx/sRVq
 cBuaNTJIU5uB+IuWkZNL2/HpdbfLw77OkKn2NlEi1AF19/voq4YxMaEuRuNjjExCWd9DG+jA/BT
 l68jTTzZ4Ef/DC63Affpq1EIgyHRQd7vlSrBhuRYG3ssci3paTTsWECmh6v8HLbEg1d38lA0jyf
 Y10Z4vXkR1gn0a3PX4/NAv4dGPAXQKUfudiLeW2Vfvt86IHJSKC8UHZYiht
X-Received: by 2002:a05:6000:1786:b0:426:fb28:7962 with SMTP id
 ffacd0b85a97d-429a7e86fdfmr2928272f8f.61.1761650774551; 
 Tue, 28 Oct 2025 04:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGETdkF66wnM/c6tdOrhBxuzOwc3yOBlYJznoC3hIKtlaNeiI1lra6JkwvXW2aYr0luCfwf0Nojvl5BfiA25S4=
X-Received: by 2002:a05:6000:1786:b0:426:fb28:7962 with SMTP id
 ffacd0b85a97d-429a7e86fdfmr2928235f8f.61.1761650773954; Tue, 28 Oct 2025
 04:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <ec836b4e6e7521806eba90c4218593c144b103a7.1761644606.git.chenmiao@openatom.club>
In-Reply-To: <ec836b4e6e7521806eba90c4218593c144b103a7.1761644606.git.chenmiao@openatom.club>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Oct 2025 12:26:01 +0100
X-Gm-Features: AWmQ_bk57Fe8YiJd2x8AJj_hDnuIZI0hYlxxuUi6zJGKkjg-qoDVQH6od6V8OUI
Message-ID: <CABgObfYiUkoS=0f603T-Aqs732j+2_VqopvgRFe-4Q6DJbrK-g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] rust/hw/gpio: Add the the first gpio device
 pcf8574
To: chenmiao <chenmiao@openatom.club>
Cc: zhao1.liu@intel.com, manos.pitsidianakis@linaro.org, 
 richard.henderson@linaro.org, philmd@linaro.org, chao.liu@openatom.club, 
 qemu-rust@nongnu.org, qemu-devel@nongnu.org, 
 hust-os-kernel-patches@googlegroups.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eKu8S082812AOTXxgAEOFSZXRwg3fQcWJkpSDVNvwQY_1761650775
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

On Tue, Oct 28, 2025 at 11:19=E2=80=AFAM chenmiao <chenmiao@openatom.club> =
wrote:
>
> After implementing the I2CBus and I2CSlave, we proceeded to implement a b=
asic
> GPIO device =E2=80=94 the PCF8574 =E2=80=94 which depends on I2CSlave.

Yes, this is a good choice.

> The most significant insight I gained during this process is that the cur=
rent
> approach in Rust appears to be more complex and harder to understand than=
 its
> C counterpart. This trend poses a substantial barrier for developers inte=
rested
> in Rust for QEMU, preventing them from efficiently, quickly, and safely m=
odeling
> QEMU devices in Rust. In my opinion, this deviates from the original inte=
nt of
> adopting Rust.

If you were implementing a new serial device, for example, you would
just write a new directory in rust/hw/char.

Even in that case, creating the meson.build file is more complex than
in C; I'm working on simplifying that by adding new features to Meson.

In other words, you're not wrong at all but note that you are not
seeing the code from the point of view of someone implementing the
Rust-to-C bridges, not someone implementing a new device, because
there are no I2C devices yet in QEMU that are written in Rust. I agree
that this is a relatively large work, on the other it only has to be
done once.

> Moreover, the mechanisms of bindings and wrappers are overly redundant, a=
nd
> there is no clear indication that they are mandatory. These constructs ge=
nerate
> a large number of similar structures in the final compilation artifacts. =
Could
> we design a more generic approach to bindings and wrappers?

Bindings are redundant across crates, indeed. It is probably possible
to improve how they work.

> Additionally, vmstate has not been fully implemented for the PCF8574 (to =
be
> precise, it is not yet complete). During the implementation, I encountere=
d an
> issue: initially, I tried to directly transliterate the C struct =E2=80=
=94 that is, I
> attempted to configure vmstate and handle other aspects directly via fiel=
d
> mappings. However, I eventually found that some internal APIs were incomp=
atible.
> To make it work, I had to isolate those "potentially mutable values" into=
 a
> separate structure, akin to something like a "PL011Register", in order fo=
r it
> to function correctly.

This is correct and intended. It isolates the interior-mutable parts
of the struct and in the future it can be used to support
multi-threaded devices too.

> +// impl_vmstate_struct!(
> +//     I2CSlave,
> +//     VMStateDescriptionBuilder::<I2CSlave>::new()
> +//         .name(c"I2CSlave")
> +//         .version_id(1)
> +//         .minimum_version_id(1)
> +//         .post_load(&I2CSlave::post_load)
> +//         .fields(vmstate_fields! {
> +//             vmstate_of!(I2CSlave, address),
> +//         })
> +//         .build()
> +// );

This is not needed, instead you can implement VMState for I2CSlave:

impl_vmstate_c_struct!(I2CSlave, bindings::vmstate_i2c_slave);

> +bilge =3D { version =3D "0.2.0" }
> +bilge-impl =3D { version =3D "0.2.0" }
> +chardev =3D { path =3D "../../../chardev" }

You don't need these.

> +_libpcf8574_bindings_inc_rs =3D rust.bindgen(
> +  input: 'wrapper.h',
> +  dependencies: common_ss.all_dependencies(),
> +  output: 'bindings.inc.rs',
> +  include_directories: bindings_incdir,
> +  bindgen_version: ['>=3D0.60.0'],
> +  args: bindgen_args_common,
> +  c_args: bindgen_c_args,
> +)

You also don't need bindgen for this simple device...

> +_libpcf8574_rs =3D static_library(
> +  'pcf8574',
> +  structured_sources(
> +    [
> +      'src/lib.rs',
> +      'src/bindings.rs',
> +      'src/device.rs',
> +    ],
> +    {'.' : _libpcf8574_bindings_inc_rs},

... and therefore you don't need structured_sources, just 'src/lib.rs'.

> +    bilge_rs,
> +    bilge_impl_rs,
> +    chardev_rs,

Also remove unneeded crates from here.

> --- /dev/null
> +++ b/rust/hw/gpio/pcf8574/src/device.rs
> @@ -0,0 +1,180 @@
> +// Copyright 2025 HUST OpenAtom Open Source Club.
> +// Author(s): Chen Miao <chenmiao@openatom.club>
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +use std::slice::from_ref;
> +
> +// use common::static_assert;
> +use bql::BqlRefCell;
> +use hwcore::{
> +    bindings, DeviceClass, DeviceImpl, DeviceMethods, DeviceState, I2CSl=
ave, I2CSlaveImpl,
> +    InterruptSource, ResetType, ResettablePhasesImpl,
> +};
> +use migration::{
> +    self, impl_vmstate_struct, vmstate_fields, vmstate_of, VMStateDescri=
ption,
> +    VMStateDescriptionBuilder,
> +};
> +use qom::{qom_isa, IsA, Object, ObjectImpl, ObjectType, ParentField};
> +use util::Result;
> +
> +const PORTS_COUNT: usize =3D 8;
> +
> +#[repr(C)]
> +#[derive(Debug, Default)]
> +pub struct PCF8574StateInner {
> +    pub lastrq: u8,
> +    pub input: u8,
> +    pub output: u8,
> +}

This is small and simple enough that it can be Copy.

> +#[repr(C)]
> +#[derive(qom::Object, hwcore::Device)]
> +pub struct PCF8574State {
> +    pub parent_obj: ParentField<I2CSlave>,
> +    pub inner: BqlRefCell<PCF8574StateInner>,
> +    pub handler: [InterruptSource; PORTS_COUNT],
> +    pub intrq: InterruptSource,
> +}
> +
> +// static_assert!(size_of::<PCF8574State>() <=3D size_of::<crate::bindin=
gs::PCF8574State>());
> +
> +qom_isa!(PCF8574State: I2CSlave, DeviceState, Object);
> +
> +#[allow(dead_code)]
> +trait PCF8574Impl: I2CSlaveImpl + IsA<PCF8574State> {}
> +
> +unsafe impl ObjectType for PCF8574State {
> +    type Class =3D DeviceClass;
> +    const TYPE_NAME: &'static std::ffi::CStr =3D crate::TYPE_PCF8574;
> +}
> +
> +impl PCF8574Impl for PCF8574State {}
> +
> +impl ObjectImpl for PCF8574State {
> +    type ParentType =3D I2CSlave;
> +    const CLASS_INIT: fn(&mut Self::Class) =3D Self::Class::class_init::=
<Self>;
> +}
> +
> +impl DeviceImpl for PCF8574State {
> +    const VMSTATE: Option<migration::VMStateDescription<Self>> =3D Some(=
VMSTATE_PCF8574);
> +    const REALIZE: Option<fn(&Self) -> util::Result<()>> =3D Some(Self::=
realize);
> +}
> +
> +impl ResettablePhasesImpl for PCF8574State {
> +    const HOLD: Option<fn(&Self, ResetType)> =3D Some(Self::reset_hold);
> +}
> +
> +impl I2CSlaveImpl for PCF8574State {
> +    const SEND: Option<fn(&Self, data: u8) -> util::Result<bool>> =3D So=
me(Self::send);
> +    const RECV: Option<fn(&Self) -> util::Result<bool>> =3D Some(Self::r=
ecv);
> +    const SEND_ASYNC: Option<fn(&Self, data: u8)> =3D None;
> +    const EVENT: Option<fn(&Self, event: hwcore::I2CEvent) -> util::Resu=
lt<hwcore::I2CEvent>> =3D
> +        None;
> +    const MATCH_AND_ADD: Option<
> +        fn(
> +            &Self,
> +            address: u8,
> +            broadcast: bool,
> +            current_devs: *mut bindings::I2CNodeList,
> +        ) -> Result<bool>,
> +    > =3D None;

You don't need to redeclare the ones that are "None".

> +}
> +
> +impl PCF8574State {
> +    fn send(&self, data: u8) -> Result<bool> {
> +        let prev =3D self.line_state();
> +        self.inner.borrow_mut().output =3D data;

I think you can use a function like

impl PCF8574Inner {
    pub fn line_state(&self) {
         self.input & self.output
    }

    pub fn set_outputs(&mut self, data: u32) -> PCF8574Inner {
         let prev =3D self.line_state();
         self.output =3D data;
         let actual =3D self.line_state();
         self
     }
}

by making PCF8574Inner "Copy". This removes a lot of the borrows you need b=
elow.

> +        let actual =3D self.line_state();
> +
> +        let mut diff =3D actual ^ prev;
> +        while diff !=3D 0 {
> +            let line =3D diff.trailing_zeros() as u8;
> +            if let Some(handler) =3D self.handler.get(line as usize) {
> +                if handler.get() {
> +                    handler.set((actual >> line) & 1 =3D=3D 1);
> +                }

There's no need to check if a GPIO line is connected, InterruptSource
handles it. (This can also be changed in the C version).

> +    fn recv(&self) -> Result<bool> {
> +        let line_state =3D self.line_state();
> +        if self.inner.borrow().lastrq !=3D line_state {
> +            self.inner.borrow_mut().lastrq =3D line_state;

Same here, part of the logic can be moved to PCF8574Inner:

    pub fn receive(&mut self, data: u32) -> (bool, u32) {
         let prev =3D self.lastrq;
         let actual =3D self.line_state();
         self.lastrq =3D actual;
         (prev !=3D actual, actual)
     }

The second element of the tuple is needed because...

> +            if self.intrq.get() {
> +                self.intrq.raise();
> +            }
> +        }
> +
> +        Ok(true)

... RECV should return a byte, not a bool.

> +    }
> +
> +    fn realize(&self) -> util::Result<()> {
> +        self.init_gpio_in(self.handler_size(), PCF8574State::gpio_set);
> +        self.init_gpio_out(from_ref(&self.handler[0]));
> +        self.init_gpio_out_named(from_ref(&self.intrq), "nINT", 1);
> +        Ok(())
> +        // unsafe {
> +        //   bindings::qdev_init_gpio_in(addr_of_mut!(*self), Self::gpio=
_set, Self::handler_size as c_int);
> +        //   bindings::qdev_init_gpio_out(addr_of_mut!(*self), Interrupt=
Source::slice_as_ptr(self.handler), Self::handler_size as c_int);
> +        //   bindings::qdev_init_gpio_out_named(addr_of_mut!(*self), sel=
f.intrq, c"nINT", 1);
> +        // }
> +    }
> +
> +    fn gpio_set(&self, line: u32, level: u32) {
> +        assert!(line < self.handler_size());
> +
> +        match level {
> +            0 =3D> self.inner.borrow_mut().input &=3D !(1 << line),
> +            _ =3D> self.inner.borrow_mut().input |=3D 1 << line,
> +        }

Again, move this to PCF8574Inner. deposit is in
common::bitops::IntegerExt and lets you write this:

    pub fn set_input(&mut self, n: u32, value: u32) -> bool {
         self.input =3D self.input.deposit(n, 1, value);
         self.line_state() !=3D self.lastrq
     }

> +        if self.line_state() !=3D self.inner.borrow().lastrq && self.int=
rq.get() {
> +            self.intrq.raise();
> +        }
> +    }
> +
> +    fn handler_size(&self) -> u32 {
> +        self.handler.len() as u32
> +    }
> +!(
> +    fn line_state(&self) -> u8 {
> +        let inner =3D self.inner.borrow();
> +        inner.input & inner.output
> +    }
> +
> +    fn reset_hold(&self, _type: ResetType) {}

This should clear PCF8574Inner (it can be another method in there).

> +}
> +
> +impl_vmstate_struct!(
> +    PCF8574StateInner,
> +    VMStateDescriptionBuilder::<PCF8574StateInner>::new()
> +        .name(c"pcf8574/inner")
> +        .version_id(0)
> +        .minimum_version_id(0)
> +        .fields(vmstate_fields! {
> +            vmstate_of!(PCF8574StateInner, lastrq),
> +            vmstate_of!(PCF8574StateInner, input),
> +            vmstate_of!(PCF8574StateInner, output),
> +        })
> +        .build()
> +);
> +
> +pub const VMSTATE_PCF8574: VMStateDescription<PCF8574State> =3D
> +    VMStateDescriptionBuilder::<PCF8574State>::new()
> +        .name(c"pcf8574")
> +        .version_id(0)
> +        .minimum_version_id(0)
> +        .fields(vmstate_fields! {
> +            // TODO
> +            // vmstate_of!(PCF8574State, parent_obj),

You're right, for this to work you'll need to add

impl_vmstate_transparent!(ParentField<T> where T: VMState);

to rust/qom/src/qom.rs and

impl_vmstate_transparent!(std::mem::ManuallyDrop<T> where T: VMState);

to rust/migration/src/vmstate.rs.  I'll send a patch for this.

But really -- not a bad job at all!  Thanks very much for trying,
remember that Zhao and Manos and myself have been working on this for
over a year.  Your experience and your suggestions will be precious,
so please let us know what can be done better.

Paolo



Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B8CCD1BF
	for <qemu-rust@archiver.kernel.org>; Tue, 28 Oct 2025 10:47:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vDhE4-0008EK-G5; Tue, 28 Oct 2025 06:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDhDD-0007W1-Nl
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 06:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDhD8-0005e2-Jz
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 06:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761648351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9AwSIhFLohNgUvn+e/21kSE+AGA2DH84ZlkxKHh3Kc=;
 b=H+vSpRt7zW5t7XM+jLXKFU8LEB89dK+LCAPTKo3S6TJ8kgBd0r3nz7/TSSmXx1OCBrCON4
 zIvN7+OyX9slgx8RiSf+yXZD1H/NrgL2uufi7Ox81Qy9RYlcCj8nQv4xv2vdqbfKkJx/so
 G8bKstMgsdRKNMqe29ck5NGPso3Rrdk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-bBwx_4zMNteUpdT74TGUjA-1; Tue, 28 Oct 2025 06:45:47 -0400
X-MC-Unique: bBwx_4zMNteUpdT74TGUjA-1
X-Mimecast-MFC-AGG-ID: bBwx_4zMNteUpdT74TGUjA_1761648347
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4256fae4b46so4621636f8f.0
 for <qemu-rust@nongnu.org>; Tue, 28 Oct 2025 03:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761648346; x=1762253146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9AwSIhFLohNgUvn+e/21kSE+AGA2DH84ZlkxKHh3Kc=;
 b=gV3kAVkdYtm+I9yTREbJ9SwNw/XZHOmXznm//EcUREJ5UU4+2vLeCDRHT8cgGk+m+E
 1CgZnLOCPbjsbaRspBk0zubVXPucc6C57HmsOK915/dTeqWs4XvQkSybGCIQ/1L7Sqa5
 ibAysBHFKpThZyFoS4zedPgwFDqoxdP9qohm8fegcMF9JkL8jHT4AJDRii64wb+RtfW5
 4qbMfdWZc1yqSjTs5q2v81H02t798G8F1hIcQ/V5sOUzDZV1HErjA+pxULtbZWrKpxoK
 Vk4jV8kp+Lk59sJw3fvShEgXWBkLsZOn0POQUFY3ODdkRhB88UjVoMnXR5+95ze2aVpX
 clBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv625Mh5Am1Gc5iUddPJVff32/2H9SGQK60gLfeF17bHvxTfMyjp4i7SyhqmZwrrVZVA+u/zQLvIo=@nongnu.org
X-Gm-Message-State: AOJu0YwWlEmNfeVlOSKCVGEMoVNTFsNmwQ0rdPXMAeAfqMy/6XqE2tjx
 vlUEYQEbAMUXDnwojuAq2i9k24Lt7/rBivfMYwaxlwIyoHW8Ra7k/GGbRqTFfSsLrNCH3sO7rYh
 kSDj9/lBvU48yjos5psOrdN3++SmTuDxd1Hftea8/u1nEJl8LRPEE3R+/XZAXm/jriuXeu3vUf3
 DNkztvYF3o3p82yqKHF1nHB6c/lszJgQ==
X-Gm-Gg: ASbGncuycprlDy1V06q4ZFn/h/eQgw+ssstAxwTX9a0tYuHKeKxNnq1TJVeS+rMvxGs
 5Kb2r63fpS954rAWWp1lYNr+AJCNqFSRqcY9U8+YJTyoOuHswttQ3rreIMiNzaztCAn8EHO1MMW
 xOes2o4zkkKNEjISnp88JYf/CfsOitOg6V9BWksAKyl57z4/mWNtAOAvE+dp1ZDsD2KnpdVxZJ0
 lseOKiJapMXduTowEHY2WZIs9mHpxkjDX0Gfk+KxAXXPyR1LxWMsU+LIkEP
X-Received: by 2002:a05:6000:65c:b0:429:a894:a2f2 with SMTP id
 ffacd0b85a97d-429a894a4bcmr1608139f8f.34.1761648346502; 
 Tue, 28 Oct 2025 03:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7S7fUOcdF6jM43rZmTG7RF/KZf0qthIbiHRkBB1AXgOxsLsnC7YOezeAo5z/Y4PAlG/DjcK1kIYovWsnRPnc=
X-Received: by 2002:a05:6000:65c:b0:429:a894:a2f2 with SMTP id
 ffacd0b85a97d-429a894a4bcmr1608112f8f.34.1761648346024; Tue, 28 Oct 2025
 03:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <db9abfc03f0dbc953ef314ff7f13ff19298efa7d.1761644606.git.chenmiao@openatom.club>
In-Reply-To: <db9abfc03f0dbc953ef314ff7f13ff19298efa7d.1761644606.git.chenmiao@openatom.club>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Oct 2025 11:45:33 +0100
X-Gm-Features: AWmQ_bmV1C0EsdOjjZAfRAJ0z0bOVVGzAvGuJs3TJZRqFsZlaL2dbs-ZLQyc6fU
Message-ID: <CABgObfaBbf9Hq7RRLkhsa5n0-J+boe1T4guEakOEXDHFrc=4AQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] rust/hw/core: Add rust bindings/funcs for i2c
 bus
To: chenmiao <chenmiao@openatom.club>
Cc: zhao1.liu@intel.com, manos.pitsidianakis@linaro.org, 
 richard.henderson@linaro.org, philmd@linaro.org, chao.liu@openatom.club, 
 qemu-rust@nongnu.org, qemu-devel@nongnu.org, 
 hust-os-kernel-patches@googlegroups.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BbMjkj2T-J5x7wVtfZnYHeFvNXcrSzmYWIEOGklH9GM_1761648347
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

On Tue, Oct 28, 2025 at 11:18=E2=80=AFAM chenmiao <chenmiao@openatom.club> =
wrote:
> During the implementation process, we found that the current two paradigm=
s in
> Rust =E2=80=94 bindings and impl =E2=80=94 are extremely complex and lack=
 comprehensive
> documentation. There is no clear explanation as to why Bus and Device mod=
els
> need to be implemented using different approaches.

I don't think they need to be implemented using different approaches.
The difference between the two is that:

- the currently implemented devices do not expose any bus, they stay
on a bus. This means the bus is never a child of the device

- the currently implemented buses are all in C code, whereas there are
devices implemented in Rust.

I agree that the Rust-to-C bridge code is complex, but it does have
documentation, much more so than the C versions in fact.  If there are
specific aspects of the documentation that you would like to see
improved, you can help by explaining what problems and sources of
confusion you encountered.

> +/// A safe wrapper around [`bindings::I2CBus`].
> +#[repr(transparent)]
> +#[derive(Debug, common::Wrapper)]
> +pub struct I2CBus(Opaque<bindings::I2CBus>);
> +
> +unsafe impl Send for I2CBus {}
> +unsafe impl Sync for I2CBus {}
> +
> +unsafe impl ObjectType for I2CBus {
> +    type Class =3D BusClass;
> +    const TYPE_NAME: &'static CStr =3D
> +        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_I2C_=
BUS) };
> +}
> +
> +qom_isa!(I2CBus: BusState, Object);
> +
> +// TODO: add virtual methods
> +pub trait I2CBusImpl: DeviceImpl + IsA<I2CBus> {}
> +/// Trait for methods of [`I2CBus`] and its subclasses.
> +pub trait I2CBusMethods: ObjectDeref
> +where
> +    Self::Target: IsA<I2CBus>


There are no virtual methods, and therefore I2CBus does not have
subclasses.  Therefore you don't need these traits and you can
implement the functions directly on I2CBus.

> +{
> +    /// # Safety
> +    ///
> +    /// Initialize an I2C bus
> +    fn init_bus(&self, parent: &DeviceState, name: &str) -> *mut binding=
s::I2CBus {
> +        assert!(bql::is_locked());
> +        unsafe { bindings::i2c_init_bus(parent.as_mut_ptr(), name.as_ptr=
().cast()) }
> +    }

This should return an Owned<I2CBus>.

> +    /// Sets the I2C bus master.
> +    ///
> +    /// # Safety
> +    ///
> +    /// This function is unsafe because:
> +    /// - `bh` must be a valid pointer to a `QEMUBH`.
> +    /// - The caller must ensure that `self` is in a valid state.
> +    /// - The caller must guarantee no data races occur during execution=
.
> +    ///
> +    /// TODO: `bindings:QEMUBH` should be wrapped by Opaque<>.
> +    unsafe fn set_master(&self, bh: *mut bindings::QEMUBH) {
> +        assert!(bql::is_locked());
> +        unsafe { bindings::i2c_bus_master(self.upcast().as_mut_ptr(), bh=
) }
> +    }

I agree with Zhao, I would leave out this completely. You can add a
TODO ("i2c_bus_master missing until QEMUBH is wrapped").

> +    /// # Safety
> +    ///
> +    /// Release an I2C bus
> +    fn release(&self) {
> +        assert!(bql::is_locked());
> +        unsafe { bindings::i2c_bus_release(self.upcast().as_mut_ptr()) }
> +    }

Same for this, which is the counterpart of i2c_bus_master. In Rust, in
fact, release() should be done with an RAII guard returned by
set_master.

> +unsafe impl ObjectType for I2CSlave {
> +    type Class =3D I2CSlaveClass;
> +    const TYPE_NAME: &'static CStr =3D
> +        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_I2C_=
SLAVE) };
> +}
> +
> +qom_isa!(I2CSlave: DeviceState, Object);
> +
> +// TODO: add virtual methods
> +pub trait I2CSlaveImpl: DeviceImpl + IsA<I2CSlave> {
> +    /// Master to slave. Returns non-zero for a NAK, 0 for success.
> +    const SEND: Option<fn(&Self, data: u8) -> Result<bool>> =3D None;

Make it return an "enum I2CResult { Ack, Nack };" instead of a Result.
Likewise other function pointers here do not need a Result<>.

> +    /// Master to slave (asynchronous). Receiving slave must call `i2c_a=
ck()`.
> +    const SEND_ASYNC: Option<fn(&Self, data: u8)> =3D None;

This requires the bottom half machinery. Leave it out.

> +/// Trait for methods of [`I2CSlave`] and its subclasses.
> +pub trait I2CSlaveMethods: ObjectDeref
> +where
> +    Self::Target: IsA<I2CSlave>,
> +{
> +    /// Create an I2C slave device on the heap.
> +    ///
> +    /// # Arguments
> +    /// * `name` - a device type name
> +    /// * `addr` - I2C address of the slave when put on a bus
> +    ///
> +    /// This only initializes the device state structure and allows
> +    /// properties to be set. Type `name` must exist. The device still
> +    /// needs to be realized.
> +    fn init_new(name: &str, addr: u8) -> Owned<I2CSlave> {
> +        assert!(bql::is_locked());
> +        unsafe {
> +            let slave =3D bindings::i2c_slave_new(name.as_ptr().cast(), =
addr);
> +            Owned::from(I2CSlave::from_raw(slave))
> +        }
> +    }
> +
> +    /// Create and realize an I2C slave device on the heap.
> +    ///
> +    /// # Arguments
> +    /// * `bus` - I2C bus to put it on
> +    /// * `name` - I2C slave device type name
> +    /// * `addr` - I2C address of the slave when put on a bus
> +    ///
> +    /// Create the device state structure, initialize it, put it on the
> +    /// specified `bus`, and drop the reference to it (the device is rea=
lized).
> +    fn create_simple(&self, bus: &I2CBus, name: &str, addr: u8) -> Owned=
<I2CSlave> {
> +        assert!(bql::is_locked());
> +        unsafe {
> +            let slave =3D
> +                bindings::i2c_slave_create_simple(bus.as_mut_ptr(), name=
.as_ptr().cast(), addr);
> +            Owned::from(I2CSlave::from_raw(slave))
> +        }
> +    }
> +
> +    /// Set the I2C bus address of a slave device
> +    ///
> +    /// # Arguments
> +    /// * `address` - I2C address of the slave when put on a bus
> +    fn set_address(&self, address: u8) {
> +        assert!(bql::is_locked());
> +        unsafe { bindings::i2c_slave_set_address(self.upcast().as_mut_pt=
r(), address) }
> +    }

These three are used by boards, which we don't model. We can keep the
code simple by leaving them off (in addition, init_new and
create_simple would be *class* methods, as visible from the fact that
they don't use self at all).

> +    /// Get the I2C bus address of a slave device
> +    fn get_address(&self) -> u8 {
> +        assert!(bql::is_locked());
> +        // SAFETY: the BQL ensures that no one else writes to the I2CSla=
ve structure,
> +        // and the I2CSlave must be initialized to get an IsA<I2CSlave>.
> +        let slave =3D unsafe { *self.upcast().as_ptr() };
> +        slave.address
> +    }
> +}
> +
> +impl<R: ObjectDeref> I2CSlaveMethods for R where R::Target: IsA<I2CSlave=
> {}
> +
> +/// Enum representing I2C events
> +#[repr(i32)]
> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +pub enum I2CEvent {
> +    StartRecv =3D 0,
> +    StartSend =3D 1,
> +    StartSendAsync =3D 2,
> +    Finish =3D 3,
> +    Nack =3D 4,
> +}

Make it "=3D bindings::I2C_START_RECV" etc. You can then use
#[derive(common::TryInto)] instead of implementing by hand the From
traits.

Paolo



Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB523D3B7DE
	for <qemu-rust@archiver.kernel.org>; Sun,  7 Dec 2025 04:35:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vS6TS-0001dr-9A; Sat, 06 Dec 2025 23:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vS5XE-0002uj-5K
 for qemu-rust@nongnu.org; Sat, 06 Dec 2025 22:34:08 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenmiao.ku@gmail.com>)
 id 1vS5X4-0002U9-3R
 for qemu-rust@nongnu.org; Sat, 06 Dec 2025 22:34:03 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7b852bb31d9so4014833b3a.0
 for <qemu-rust@nongnu.org>; Sat, 06 Dec 2025 19:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765078434; x=1765683234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSwW4pf421IMnpAOpJLVJ0KcWmgP1/il42L6E6pTLTg=;
 b=lfk/kXqyt2qp1s0BYp+e2MqVmcSAWKWAhoujvaPgkECJ3UmGkr08VxqOP124OInYn4
 NSLid2pNyOgQxfpymzjv+GinyPtPuVN48ypAgcIS+U6ZJVjvindIlO98u1EejLQu6YB/
 DkLWidBjZ/P2WlQTmr5RDcvRCXIIvkpi68z8Ky4nirnqIpFK9VlNSQybDF7arPLP1ZrH
 Ei8VN5nDDuevsSIWL5QKCfIeZvPD9wo6tRTpZ72t5G6vcUFui5z6e9qmpOwJoNMM7mBo
 1Xya132/Qbh5FEAt1YCR0y3WmD142add+7huTRvSqGkWDLilwfM5IG4bUXFV7Duy3xUv
 EXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765078434; x=1765683234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bSwW4pf421IMnpAOpJLVJ0KcWmgP1/il42L6E6pTLTg=;
 b=pjjH+0I2SRFZ+ONO8E482+792kc6JwKmHKWY9Wgg6kAd9PLknrICj6icT7Dm+sAUji
 eBnlGhFBMM7Bj3a+EdEa2SF97DrS0UR7ekNHZe5RgVixCfmPKqcSUeDoYueC3a4m8L+F
 qmIvGLXP+ByeGgC9j96gLdZfZzhL4rKnAkwn2iCssliEIwyEOF2FMbZ2N8HiOJW6qf2B
 gGPV96UXj3T3WGGX/wdxb1uWw9RU2DZX0OU0V88/sKXgG1nmGsnZ4CFjW0yWcQWQG4h5
 YZQyn2P0JLcOLoWA5e3ipRjbGpI35fd70l0RYUWNJSnqlmT+VC1D23UGMhYug3cluZsc
 gosw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpr02EPuJ5ftVkjyNh1oRV3JF9w17V27X1rrsDdipezihFTSK311hj+NLV0jSqDA9gyA4mr77jBFg=@nongnu.org
X-Gm-Message-State: AOJu0YzBX5aq9pdwOKvnX+fe0JdlQPU8lwsBZc0GQKKW4chQot2XY6vw
 wLML4XZkt4nJ7e5dCOwBdAHFdQB1yNj/8rY4E9EUNuq6TSuoO74UViJH
X-Gm-Gg: ASbGncsaRfajVzm1WSrbmbM+xW+jK51QmohKrRS/ll3YsURVSz7QoCe6tbwTa3vp1V9
 kFZvp1XQ9jl5G1MaPFSxyAxf4+krcUzIwxg8Sw6OgL84b9/Eacc81r1avuXae7RHT6PT3ke+aTS
 vJmgMiOQcs3NLOySJsd0oiB/my82uqsKUNH8fVE7e3I7C1AzGQXXL2LWOfOP48DcckzgE4xsctT
 na45kbyhKgAYfYtPz+mig9PN4bW1eq3MawVDIR+B80brcrDPoN4dNuNZj/41DTbTAOfIZI0c46K
 4QBAaR7qgw5oK1sbdopA/+qxZiWUVP5GOlSG2Mkey955LvuY2Qe6vnhU7R9ozaQT8cQVA+rEQ/P
 QlMDoAmu5gzsi+zLgFW88uyP6pZweKVQsdzy4ytSxgkYjasAZdmBf/+vPxFyPwRGrCn82RSmSqN
 8dFS3Ojxa6GuJ3Y+2NrpA6SpDZbBzUWUGIB3vGcEnpz1iJLqbImm8FyTri
X-Google-Smtp-Source: AGHT+IHpR8p/qL9farnjOh8NgbA99bpbxfluk9KjHutTIiDbXkCzieunD6uKWtl0YXYZKJ4dl6FHGg==
X-Received: by 2002:a05:6a21:4ed7:20b0:366:14ac:e1de with SMTP id
 adf61e73a8af0-3661802629amr2693628637.68.1765078433718; 
 Sat, 06 Dec 2025 19:33:53 -0800 (PST)
Received: from nyaos.localdomain ([166.0.199.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bf6a1caeea7sm8496390a12.24.2025.12.06.19.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Dec 2025 19:33:53 -0800 (PST)
From: ChenMiao <chenmiao.ku@gmail.com>
To: zhao1.liu@intel.com, pbonzini@redhat.com, manos.pitsidianakis@linaro.org,
 richard.henderson@linaro.org, philmd@linaro.org
Cc: chao.liu@openatom.club , dzm91@openatom.club , qemu-rust@nongnu.org,
 qemu-devel@nongnu.org, hust-os-kernel-patches@googlegroups.com,
 chenmiao <chenmiao@openatom.club>
Subject: [PATCH v3 2/4] rust/hw/core: Add rust bindings/funcs for i2c bus
Date: Sun,  7 Dec 2025 03:33:29 +0000
Message-ID: <48bfe2bd3b11f09bd501622370ca64bdb1f68afb.1765077679.git.chenmiao@openatom.club>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765077679.git.chenmiao@openatom.club>
References: <cover.1765077679.git.chenmiao@openatom.club>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=chenmiao.ku@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 06 Dec 2025 23:34:16 -0500
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

From: chenmiao <chenmiao@openatom.club>

We have implemented the I2CBus and I2CSlave infrastructure in Rust by referring
to the SysBus device model.

Initially, we assumed that the I2CBus was at the same hierarchical level as the
PL011 device. Therefore, we followed the implementation paradigm of the PL011
device as a reference. However, in the end, we discovered that the I2CBus is
actually at the same level as the SysBus. As a result, we adopted the binding
implementation paradigm used for SysBus devices. With this adjustment, we
successfully compiled the code locally.

During the implementation process, we found that the current two paradigms in
Rust — bindings and impl — are extremely complex and lack comprehensive
documentation. There is no clear explanation as to why Bus and Device models
need to be implemented using different approaches. Furthermore, the
implementation of Bus and Device following these paradigms still has many
limitations. At present, at least vmstate is not easily supported.

Signed-off-by: Chao Liu <chao.liu@openatom.club>
Signed-off-by: Chen Miao <chenmiao@openatom.club>
---
 rust/hw/core/meson.build |   1 +
 rust/hw/core/src/i2c.rs  | 303 +++++++++++++++++++++++++++++++++++++++
 rust/hw/core/src/lib.rs  |   3 +
 rust/hw/core/wrapper.h   |   1 +
 4 files changed, 308 insertions(+)
 create mode 100644 rust/hw/core/src/i2c.rs

diff --git a/rust/hw/core/meson.build b/rust/hw/core/meson.build
index efcda50fef..1a27c1cff7 100644
--- a/rust/hw/core/meson.build
+++ b/rust/hw/core/meson.build
@@ -52,6 +52,7 @@ _hwcore_rs = static_library(
       'src/bindings.rs',
       'src/bus.rs',
       'src/irq.rs',
+      'src/i2c.rs',
       'src/qdev.rs',
       'src/sysbus.rs',
     ],
diff --git a/rust/hw/core/src/i2c.rs b/rust/hw/core/src/i2c.rs
new file mode 100644
index 0000000000..85ec34357a
--- /dev/null
+++ b/rust/hw/core/src/i2c.rs
@@ -0,0 +1,303 @@
+// Copyright 2025 HUST OpenAtom Open Source Club.
+// Author(s): Chao Liu <chao.liu@openatom.club>
+// Author(s): Chen Miao <chenmiao@openatom.club>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! Bindings to access `i2c` functionality from Rust.
+
+use std::{ffi::CStr, ptr::NonNull};
+
+pub use crate::bindings::I2CSlaveClass;
+use common::{self, Opaque};
+use migration::impl_vmstate_c_struct;
+use qom::{prelude::*, Owned};
+
+use crate::{
+    bindings,
+    bus::{BusClass, BusState},
+    qdev::{DeviceImpl, DeviceState},
+};
+
+/// A safe wrapper around [`bindings::I2CBus`].
+#[repr(transparent)]
+#[derive(Debug, common::Wrapper)]
+pub struct I2CBus(Opaque<bindings::I2CBus>);
+
+unsafe impl Send for I2CBus {}
+unsafe impl Sync for I2CBus {}
+
+unsafe impl ObjectType for I2CBus {
+    type Class = BusClass;
+    const TYPE_NAME: &'static CStr =
+        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_I2C_BUS) };
+}
+
+qom_isa!(I2CBus: BusState, Object);
+
+/// Trait for methods of [`I2CBus`] and its subclasses.
+pub trait I2CBusMethods: ObjectDeref
+where
+    Self::Target: IsA<I2CBus>,
+{
+    /// # Safety
+    ///
+    /// Initialize an I2C bus
+    fn init_bus(&self, parent: &DeviceState, name: &str) -> Owned<I2CBus> {
+        assert!(bql::is_locked());
+        unsafe {
+            let bus = bindings::i2c_init_bus(parent.as_mut_ptr(), name.as_ptr().cast());
+            let bus: &I2CBus = I2CBus::from_raw(bus);
+            Owned::from(bus)
+        }
+    }
+
+    /// # Safety
+    ///
+    /// Start a transfer on an I2C bus
+    fn start_transfer(&self, address: u8, is_recv: bool) -> i32 {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_start_transfer(self.upcast().as_mut_ptr(), address, is_recv) }
+    }
+
+    /// # Safety
+    ///
+    /// Start a receive transfer on an I2C bus
+    fn start_recv(&self, address: u8) -> i32 {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_start_recv(self.upcast().as_mut_ptr(), address) }
+    }
+
+    /// # Safety
+    ///
+    /// Start a send transfer on an I2C bus
+    fn start_send(&self, address: u8) -> i32 {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_start_send(self.upcast().as_mut_ptr(), address) }
+    }
+
+    /// # Safety
+    ///
+    /// End a transfer on an I2C bus
+    fn end_transfer(&self) {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_end_transfer(self.upcast().as_mut_ptr()) }
+    }
+
+    /// # Safety
+    ///
+    /// Send NACK on an I2C bus
+    fn nack(&self) {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_nack(self.upcast().as_mut_ptr()) }
+    }
+
+    /// # Safety
+    ///
+    /// Send ACK on an I2C bus
+    fn ack(&self) {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_ack(self.upcast().as_mut_ptr()) }
+    }
+
+    /// # Safety
+    ///
+    /// Send data on an I2C bus
+    fn send(&self, data: u8) -> i32 {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_send(self.upcast().as_mut_ptr(), data) }
+    }
+
+    /// # Safety
+    ///
+    /// Receive data from an I2C bus
+    fn recv(&self) -> u8 {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_recv(self.upcast().as_mut_ptr()) }
+    }
+
+    /// # Safety
+    ///
+    /// Check if the I2C bus is busy.
+    ///
+    /// Returns `true` if the bus is busy, `false` otherwise.
+    fn is_busy(&self) -> bool {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_bus_busy(self.upcast().as_mut_ptr()) != 0 }
+    }
+
+    /// # Safety
+    ///
+    /// Schedule pending master on an I2C bus
+    fn schedule_pending_master(&self) {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_schedule_pending_master(self.upcast().as_mut_ptr()) }
+    }
+
+    /// Sets the I2C bus master.
+    ///
+    /// # Safety
+    ///
+    /// This function is unsafe because:
+    /// - `bh` must be a valid pointer to a `QEMUBH`.
+    /// - The caller must ensure that `self` is in a valid state.
+    /// - The caller must guarantee no data races occur during execution.
+    ///
+    /// TODO ("`i2c_bus_master` missing until QEMUBH is wrapped")
+    unsafe fn set_master(&self, bh: *mut bindings::QEMUBH) {
+        assert!(bql::is_locked());
+        unsafe { bindings::i2c_bus_master(self.upcast().as_mut_ptr(), bh) }
+    }
+}
+
+impl<R: ObjectDeref> I2CBusMethods for R where R::Target: IsA<I2CBus> {}
+
+/// A safe wrapper around [`bindings::I2CSlave`].
+#[repr(transparent)]
+#[derive(Debug, common::Wrapper)]
+pub struct I2CSlave(Opaque<bindings::I2CSlave>);
+
+unsafe impl Send for I2CSlave {}
+unsafe impl Sync for I2CSlave {}
+
+unsafe impl ObjectType for I2CSlave {
+    type Class = I2CSlaveClass;
+    const TYPE_NAME: &'static CStr =
+        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_I2C_SLAVE) };
+}
+
+qom_isa!(I2CSlave: DeviceState, Object);
+
+impl_vmstate_c_struct!(I2CSlave, bindings::vmstate_i2c_slave);
+
+#[derive(common::TryInto)]
+#[repr(u64)]
+#[allow(non_camel_case_types)]
+pub enum I2CResult {
+    ACK = 0,
+    NACK = 1,
+}
+
+// TODO: add virtual methods
+pub trait I2CSlaveImpl: DeviceImpl + IsA<I2CSlave> {
+    /// Master to slave. Returns non-zero for a NAK, 0 for success.
+    const SEND: Option<fn(&Self, data: u8) -> I2CResult> = None;
+
+    /// Slave to master. This cannot fail, the device should always return something here.
+    const RECV: Option<fn(&Self) -> u8> = None;
+
+    /// Notify the slave of a bus state change. For start event,
+    /// returns non-zero to NAK an operation. For other events the
+    /// return code is not used and should be zero.
+    const EVENT: Option<fn(&Self, event: I2CEvent) -> I2CEvent> = None;
+
+    /// Check if this device matches the address provided. Returns bool of
+    /// true if it matches (or broadcast), and updates the device list, false
+    /// otherwise.
+    ///
+    /// If broadcast is true, match should add the device and return true.
+    #[allow(clippy::type_complexity)]
+    const MATCH_AND_ADD: Option<
+        fn(&Self, address: u8, broadcast: bool, current_devs: *mut bindings::I2CNodeList) -> bool,
+    > = None;
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer that
+/// can be downcasted to type `T`. We also expect the device is
+/// readable/writeable from one thread at any time.
+unsafe extern "C" fn rust_i2c_slave_send_fn<T: I2CSlaveImpl>(
+    obj: *mut bindings::I2CSlave,
+    data: u8,
+) -> std::os::raw::c_int {
+    let state = NonNull::new(obj).unwrap().cast::<T>();
+    T::SEND.unwrap()(unsafe { state.as_ref() }, data).into_bits() as std::os::raw::c_int
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer that
+/// can be downcasted to type `T`. We also expect the device is
+/// readable/writeable from one thread at any time.
+unsafe extern "C" fn rust_i2c_slave_recv_fn<T: I2CSlaveImpl>(obj: *mut bindings::I2CSlave) -> u8 {
+    let state = NonNull::new(obj).unwrap().cast::<T>();
+    T::RECV.unwrap()(unsafe { state.as_ref() })
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer that
+/// can be downcasted to type `T`. We also expect the device is
+/// readable/writeable from one thread at any time.
+unsafe extern "C" fn rust_i2c_slave_event_fn<T: I2CSlaveImpl>(
+    obj: *mut bindings::I2CSlave,
+    event: bindings::i2c_event,
+) -> std::os::raw::c_int {
+    let state = NonNull::new(obj).unwrap().cast::<T>();
+    T::EVENT.unwrap()(unsafe { state.as_ref() }, I2CEvent::from_bits(event)).into_bits()
+        as std::os::raw::c_int
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer that
+/// can be downcasted to type `T`. We also expect the device is
+/// readable/writeable from one thread at any time.
+unsafe extern "C" fn rust_i2c_slave_match_and_add_fn<T: I2CSlaveImpl>(
+    obj: *mut bindings::I2CSlave,
+    address: u8,
+    broadcast: bool,
+    current_devs: *mut bindings::I2CNodeList,
+) -> bool {
+    let state = NonNull::new(obj).unwrap().cast::<T>();
+    T::MATCH_AND_ADD.unwrap()(unsafe { state.as_ref() }, address, broadcast, current_devs)
+}
+
+impl I2CSlaveClass {
+    /// Fill in the virtual methods of `I2CSlaveClass` based on the
+    /// definitions in the `I2CSlaveImpl` trait.
+    pub fn class_init<T: I2CSlaveImpl>(&mut self) {
+        if <T as I2CSlaveImpl>::SEND.is_some() {
+            self.send = Some(rust_i2c_slave_send_fn::<T>);
+        }
+        if <T as I2CSlaveImpl>::RECV.is_some() {
+            self.recv = Some(rust_i2c_slave_recv_fn::<T>);
+        }
+        if <T as I2CSlaveImpl>::EVENT.is_some() {
+            self.event = Some(rust_i2c_slave_event_fn::<T>);
+        }
+        if <T as I2CSlaveImpl>::MATCH_AND_ADD.is_some() {
+            self.match_and_add = Some(rust_i2c_slave_match_and_add_fn::<T>);
+        }
+        self.parent_class.class_init::<T>();
+    }
+}
+
+/// Trait for methods of [`I2CSlave`] and its subclasses.
+pub trait I2CSlaveMethods: ObjectDeref
+where
+    Self::Target: IsA<I2CSlave>,
+{
+    /// Get the I2C bus address of a slave device
+    fn get_address(&self) -> u8 {
+        assert!(bql::is_locked());
+        // SAFETY: the BQL ensures that no one else writes to the I2CSlave structure,
+        // and the I2CSlave must be initialized to get an IsA<I2CSlave>.
+        let slave = unsafe { *self.upcast().as_ptr() };
+        slave.address
+    }
+}
+
+impl<R: ObjectDeref> I2CSlaveMethods for R where R::Target: IsA<I2CSlave> {}
+
+/// Enum representing I2C events
+#[derive(common::TryInto)]
+#[repr(u32)]
+#[allow(non_camel_case_types)]
+pub enum I2CEvent {
+    START_RECV = bindings::I2C_START_RECV,
+    START_SEND = bindings::I2C_START_SEND,
+    START_SEND_ASYNC = bindings::I2C_START_SEND_ASYNC,
+    FINISH = bindings::I2C_FINISH,
+    NACK = bindings::I2C_NACK,
+}
diff --git a/rust/hw/core/src/lib.rs b/rust/hw/core/src/lib.rs
index 10cc516664..3f3aecb258 100644
--- a/rust/hw/core/src/lib.rs
+++ b/rust/hw/core/src/lib.rs
@@ -16,3 +16,6 @@
 
 mod bus;
 pub use bus::*;
+
+mod i2c;
+pub use i2c::*;
diff --git a/rust/hw/core/wrapper.h b/rust/hw/core/wrapper.h
index 3bdbd1249e..399be594da 100644
--- a/rust/hw/core/wrapper.h
+++ b/rust/hw/core/wrapper.h
@@ -30,3 +30,4 @@ typedef enum memory_order {
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/irq.h"
+#include "hw/i2c/i2c.h"
-- 
2.43.0



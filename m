Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tBzOJ-0007TG-On
	for mharc-qemu-rust@gnu.org; Fri, 15 Nov 2024 11:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNZ-0006Nn-6x
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNX-0002M3-MC
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731688862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSsBp8Ew5NQp7MzYfq8I541wWmJ8ybUUCSw8jpZVemg=;
 b=Z3C56TjW6UYJi2q7tobIykfrncUoFMwGrOoSSkfhliK9SSA1eBBO6OOVMoMn5T8/nkv5rB
 XwsjyPPm+6FYLswV6c+ak8Wl096pR/U+09CFq1OF4BMebLD3L1JQ3ocHNjIMXqWPvkyzGE
 GyW+5BXGYgawLufThdnv3oUE/GkXMpk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-H5LoOYg6PA-bQIGRoqOjnA-1; Fri, 15 Nov 2024 11:41:01 -0500
X-MC-Unique: H5LoOYg6PA-bQIGRoqOjnA-1
X-Mimecast-MFC-AGG-ID: H5LoOYg6PA-bQIGRoqOjnA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-432d8843783so13197185e9.3
 for <qemu-rust@nongnu.org>; Fri, 15 Nov 2024 08:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731688860; x=1732293660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WSsBp8Ew5NQp7MzYfq8I541wWmJ8ybUUCSw8jpZVemg=;
 b=bI5OWSz5Y8N9IqDNVu04/f8n0lCB3Rv7mFMenlgMn+IBXgUhVOJ5GJuvxhzGSqagbq
 LeLlO2csp1M9wAsfmezhbBDEVDv2XkZ01VR7vXHWw1r8q6TdZf34Fhe9ke0Api1eZ4Lz
 DrVf0wQ85alIyJbwR+8f91reHAxzwDHgWlbgUue0truA+fX0Mi9LLO3PkKU3uvh+PEDl
 5TyfXyN0vaSRyWzMNw1Qj1n6m1X5sG59csN7yJRovFPK4iAA8XSWcOMREFy6XqfVmoQD
 IugEUTZy3NsfOyODUw+dJFkN1YxP0EEp9lPePyXAdFAWqtswXCDVmYbx6dnlv+HywygH
 FvCQ==
X-Gm-Message-State: AOJu0Yy8AUU2M8iQ2Emmf1Tfajg8cD45c4DUWZmXdgfj4f0I4YBDArT2
 Lve5YTKR8fyt2Pvu3CgEWY4WgtdCFZpNUNpJI+WwrtmTrJz0cX+NC8p8iWOebhohndJhEN70AfP
 0eDMShQw3dSQjUJbDZoWTGHOlKhXx5M0VndVtgFS8pZcW0u1lINI=
X-Received: by 2002:a05:6000:491d:b0:371:8319:4dbd with SMTP id
 ffacd0b85a97d-382259063b5mr2481226f8f.17.1731688859793; 
 Fri, 15 Nov 2024 08:40:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9ya/7jEKZ7UNJ/r7lIVCPBSxiM5E7y0IXZZfBCxd2cWZmn85OA/9rCUoRJ7zHpXqAREZEcw==
X-Received: by 2002:a05:6000:491d:b0:371:8319:4dbd with SMTP id
 ffacd0b85a97d-382259063b5mr2481214f8f.17.1731688859379; 
 Fri, 15 Nov 2024 08:40:59 -0800 (PST)
Received: from [192.168.10.3] ([151.49.84.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adbbd82sm4777246f8f.52.2024.11.15.08.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:40:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, berrange@redhat.com, junjie.mao@hotmail.com,
 manos.pitsidianakis@linaro.org, kwolf@redhat.com
Subject: [PATCH 08/12] rust: fix a couple style issues from clippy
Date: Fri, 15 Nov 2024 17:40:21 +0100
Message-ID: <20241115164025.1917618-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115163944.1917393-1-pbonzini@redhat.com>
References: <20241115163944.1917393-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nxzYj4QNtuWX7PUbyWfjwH4lAZCZ1lPn3OVdB4i3AZ4_1731688860
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.12,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 15 Nov 2024 16:41:10 -0000

These are reported as clippy::semicolon_inside_block and clippy::as_ptr_cast_mut.

clippy::semicolon_inside_block can be configured not to lint single-line
blocks; just go with the default.

Reviewed-by: Junjie Mao <junjie.mao@hotmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs     | 8 +++++---
 rust/hw/char/pl011/src/memory_ops.rs | 4 +++-
 rust/qemu-api/tests/tests.rs         | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 6556865fc22..e582a31e4d3 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -2,7 +2,7 @@
 // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-use core::ptr::{addr_of, addr_of_mut, NonNull};
+use core::ptr::{addr_of_mut, NonNull};
 use std::{
     ffi::CStr,
     os::raw::{c_int, c_uchar, c_uint, c_void},
@@ -499,7 +499,9 @@ pub fn update(&self) {
         let flags = self.int_level & self.int_enabled;
         for (irq, i) in self.interrupts.iter().zip(IRQMASK) {
             // SAFETY: self.interrupts have been initialized in init().
-            unsafe { qemu_set_irq(*irq, i32::from(flags & i != 0)) };
+            unsafe {
+                qemu_set_irq(*irq, i32::from(flags & i != 0));
+            }
         }
     }
 
@@ -601,7 +603,7 @@ pub fn post_load(&mut self, _version_id: u32) -> Result<(), ()> {
         let sysbus: *mut SysBusDevice = dev.cast::<SysBusDevice>();
 
         qdev_prop_set_chr(dev, c_str!("chardev").as_ptr(), chr);
-        sysbus_realize_and_unref(sysbus, addr_of!(error_fatal) as *mut *mut Error);
+        sysbus_realize_and_unref(sysbus, addr_of_mut!(error_fatal));
         sysbus_mmio_map(sysbus, 0, addr);
         sysbus_connect_irq(sysbus, 0, irq);
         dev
diff --git a/rust/hw/char/pl011/src/memory_ops.rs b/rust/hw/char/pl011/src/memory_ops.rs
index 169d485a4d2..c4e8599ba43 100644
--- a/rust/hw/char/pl011/src/memory_ops.rs
+++ b/rust/hw/char/pl011/src/memory_ops.rs
@@ -33,7 +33,9 @@
             // SAFETY: self.char_backend is a valid CharBackend instance after it's been
             // initialized in realize().
             let cb_ptr = unsafe { core::ptr::addr_of_mut!(state.as_mut().char_backend) };
-            unsafe { qemu_chr_fe_accept_input(cb_ptr) };
+            unsafe {
+                qemu_chr_fe_accept_input(cb_ptr);
+            }
 
             val
         }
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 43a4827de12..925f5a3c77b 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -74,6 +74,6 @@ impl Class for DummyClass {
 
     unsafe {
         module_call_init(module_init_type::MODULE_INIT_QOM);
-        object_unref(object_new(DummyState::TYPE_NAME.as_ptr()) as *mut _);
+        object_unref(object_new(DummyState::TYPE_NAME.as_ptr()).cast());
     }
 }
-- 
2.47.0



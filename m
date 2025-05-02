Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAnYQ-0001BD-VZ
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 06:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYO-0001A5-Pv
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYM-0000f8-Fm
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746181413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzvCV0jIjpCcgfBWJ62IvsDo2orChe3xqe3a6DGJy7Q=;
 b=HW6xgri8k8uX6cG+tNCvsGftr1TAUJdGNyvn5ROPXS2AnrSz/yob2Pr5jdYDeAQEMctfDj
 /bZFiF99JKI3Q7lJAU/9+JfpcuuaHmQaWDNrgQ/DqTO2kLaE10ih0MGE1HD9wLx5MTf3dg
 ZkZBTuDZBvXfUOyfqqC0q1TxyFwuHDg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-D4eDkDfBPxmdQC_GZMXf_A-1; Fri, 02 May 2025 06:23:32 -0400
X-MC-Unique: D4eDkDfBPxmdQC_GZMXf_A-1
X-Mimecast-MFC-AGG-ID: D4eDkDfBPxmdQC_GZMXf_A_1746181412
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-39c1b1c0969so997639f8f.1
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746181410; x=1746786210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzvCV0jIjpCcgfBWJ62IvsDo2orChe3xqe3a6DGJy7Q=;
 b=qK58KLj/OuDq562PvdkrMs9wCzZCI17dNPtyTKkc3+6qplaO5Iq7EpABI7RK2MLIL7
 3qbMbVF/LdlKWxDx7GLEwDKm2XuMbY8O9IPHmbkymMekseSYQ+YvjwLVdvN6xWUdKfoh
 ZfPsgnhtuLByuKs9XTZLHPf+jg9k2W31/SaUWBM07Wx45BrfQEgmMNI8yPT9H+xnWhN5
 M9DlAVH97MQiRAhGfdL8XwH9fxNPvAHDqdcdSzs4B/nPeomjceA39h9Tfuo8cy3qQVGy
 2A9/F3Y4zq2scMxSF2jjvxKGUH2Ati7mDQyRVtruMwPbtAVXmwPLi4vlTOJ9tOFa3isL
 vGig==
X-Gm-Message-State: AOJu0YxFMnNeSWIO3VDM3WsTvsA6gxFhDgQGUsqWwE8fFnZwKWjnXhu6
 VeEtB2dyP99oEsWjkCdoqek4apxyQwsGVW3NIf7CR3l5S6kvIJSS2t0OxagEDk0orDWVooA3Ton
 jrofTmY1mAGvkhQUs/75w245yLgGll8bCoE3IbFoM9/wSc615tgLfuw9ZS6s=
X-Gm-Gg: ASbGncv3BqDUOoaHyf7jjUuGwipF4IaCvZt4VjtMS58UPeNup4vDPnNsbqHxF7jvKtI
 TPfS72VE3kI/yKY39dzVEM+t76/atpJaJsUnirDr61yHPA4lRJXOvM2SLTqFP/Z/bFHGRb9rwcZ
 J019FQISRRT/x3qVmUARzllqHrNsO+XNtlO2PDxSFMds8fqnWJ0CerFz5WWOI5+aQJtn5N9wBrD
 U6NRsopm7DfA5goRtYskEGqPzj9+U/R6/EI7n/OXIEojzUvZ+p7x5zvFXKCsceokMmJOePzhHiD
 2gIaUbSh+TMPKfk=
X-Received: by 2002:a05:6000:1a89:b0:39e:f89b:85ce with SMTP id
 ffacd0b85a97d-3a099add434mr1594631f8f.26.1746181410434; 
 Fri, 02 May 2025 03:23:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSQATwwtvw3NZZGjjV1nPwpl8kQfPq+xK1knQ0c8q+bZLxIFZhWp9bMqgyo4MTzEBcuDNXlQ==
X-Received: by 2002:a05:6000:1a89:b0:39e:f89b:85ce with SMTP id
 ffacd0b85a97d-3a099add434mr1594612f8f.26.1746181410049; 
 Fri, 02 May 2025 03:23:30 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae82e4sm1769656f8f.58.2025.05.02.03.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:23:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/9] rust: use std::ffi instead of std::os::raw
Date: Fri,  2 May 2025 12:23:15 +0200
Message-ID: <20250502102323.104815-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502102323.104815-1-pbonzini@redhat.com>
References: <20250502102323.104815-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zBKk2nNCifyo_cHHV9HSfu4W9EcpddQWnpmiaAm8nus_1746181412
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
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
X-List-Received-Date: Fri, 02 May 2025 10:23:37 -0000

This is allowed since Rust 1.64.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst                    | 2 --
 rust/hw/char/pl011/src/device_class.rs | 2 +-
 rust/hw/timer/hpet/src/hpet.rs         | 3 +--
 rust/qemu-api/src/chardev.rs           | 3 +--
 rust/qemu-api/src/irq.rs               | 6 +++++-
 rust/qemu-api/src/lib.rs               | 2 +-
 rust/qemu-api/src/memory.rs            | 3 +--
 rust/qemu-api/src/qdev.rs              | 3 +--
 rust/qemu-api/src/qom.rs               | 3 +--
 rust/qemu-api/src/timer.rs             | 2 +-
 rust/qemu-api/src/vmstate.rs           | 2 +-
 rust/qemu-api/tests/vmstate_tests.rs   | 7 ++++++-
 12 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 3cc2841d4d1..c7dfba98de1 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -74,8 +74,6 @@ Supported tools
 QEMU supports rustc version 1.63.0 and newer.  Notably, the following features
 are missing:
 
-* ``core::ffi`` (1.64.0).  Use ``std::os::raw`` and ``std::ffi`` instead.
-
 * ``cast_mut()``/``cast_const()`` (1.65.0).  Use ``as`` instead.
 
 * "let ... else" (1.65.0).  Use ``if let`` instead.  This is currently patched
diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
index b4d4a7eb432..cd2dc33c207 100644
--- a/rust/hw/char/pl011/src/device_class.rs
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -3,7 +3,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 use std::{
-    os::raw::{c_int, c_void},
+    ffi::{c_int, c_void},
     ptr::NonNull,
 };
 
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index 12de2ba59a1..d4364f2f2f7 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -3,8 +3,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 use std::{
-    ffi::CStr,
-    os::raw::{c_int, c_void},
+    ffi::{c_int, c_void, CStr},
     pin::Pin,
     ptr::{addr_of_mut, null_mut, NonNull},
     slice::from_ref,
diff --git a/rust/qemu-api/src/chardev.rs b/rust/qemu-api/src/chardev.rs
index 11e6c45afaf..146a4852da3 100644
--- a/rust/qemu-api/src/chardev.rs
+++ b/rust/qemu-api/src/chardev.rs
@@ -10,11 +10,10 @@
 //! called.
 
 use std::{
-    ffi::CStr,
+    ffi::{c_int, c_void, CStr},
     fmt::{self, Debug},
     io::{self, ErrorKind, Write},
     marker::PhantomPinned,
-    os::raw::{c_int, c_void},
     ptr::addr_of_mut,
     slice,
 };
diff --git a/rust/qemu-api/src/irq.rs b/rust/qemu-api/src/irq.rs
index 1222d4fde30..1526e6f63a1 100644
--- a/rust/qemu-api/src/irq.rs
+++ b/rust/qemu-api/src/irq.rs
@@ -4,7 +4,11 @@
 
 //! Bindings for interrupt sources
 
-use std::{ffi::CStr, marker::PhantomData, os::raw::c_int, ptr};
+use std::{
+    ffi::{c_int, CStr},
+    marker::PhantomData,
+    ptr,
+};
 
 use crate::{
     bindings::{self, qemu_set_irq},
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
index 05f38b51d30..c3641e893b7 100644
--- a/rust/qemu-api/src/lib.rs
+++ b/rust/qemu-api/src/lib.rs
@@ -33,7 +33,7 @@
 
 use std::{
     alloc::{GlobalAlloc, Layout},
-    os::raw::c_void,
+    ffi::c_void,
 };
 
 #[cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)]
diff --git a/rust/qemu-api/src/memory.rs b/rust/qemu-api/src/memory.rs
index fdb1ea11fcf..9ef2694bd62 100644
--- a/rust/qemu-api/src/memory.rs
+++ b/rust/qemu-api/src/memory.rs
@@ -5,9 +5,8 @@
 //! Bindings for `MemoryRegion`, `MemoryRegionOps` and `MemTxAttrs`
 
 use std::{
-    ffi::{CStr, CString},
+    ffi::{c_uint, c_void, CStr, CString},
     marker::PhantomData,
-    os::raw::{c_uint, c_void},
 };
 
 pub use bindings::{hwaddr, MemTxAttrs};
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 18b4a9ba687..17c7fecabeb 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -5,8 +5,7 @@
 //! Bindings to create devices and access device functionality from Rust.
 
 use std::{
-    ffi::{CStr, CString},
-    os::raw::{c_int, c_void},
+    ffi::{c_int, c_void, CStr, CString},
     ptr::NonNull,
 };
 
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index f1b4022157b..6929e4d33ae 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -93,11 +93,10 @@
 //! without incurring into violations of orphan rules for traits.
 
 use std::{
-    ffi::CStr,
+    ffi::{c_void, CStr},
     fmt,
     mem::ManuallyDrop,
     ops::{Deref, DerefMut},
-    os::raw::c_void,
     ptr::NonNull,
 };
 
diff --git a/rust/qemu-api/src/timer.rs b/rust/qemu-api/src/timer.rs
index e769f8bc910..d697fd742bc 100644
--- a/rust/qemu-api/src/timer.rs
+++ b/rust/qemu-api/src/timer.rs
@@ -3,7 +3,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 use std::{
-    os::raw::{c_int, c_void},
+    ffi::{c_int, c_void},
     pin::Pin,
 };
 
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 98152e5964d..78c7f17db13 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -25,7 +25,7 @@
 //!   functionality that is missing from `vmstate_of!`.
 
 use core::{marker::PhantomData, mem, ptr::NonNull};
-use std::os::raw::{c_int, c_void};
+use std::ffi::{c_int, c_void};
 
 pub use crate::bindings::{VMStateDescription, VMStateField};
 use crate::{
diff --git a/rust/qemu-api/tests/vmstate_tests.rs b/rust/qemu-api/tests/vmstate_tests.rs
index f7a93117e1a..9a56ffd2385 100644
--- a/rust/qemu-api/tests/vmstate_tests.rs
+++ b/rust/qemu-api/tests/vmstate_tests.rs
@@ -2,7 +2,12 @@
 // Author(s): Zhao Liu <zhai1.liu@intel.com>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-use std::{ffi::CStr, mem::size_of, os::raw::c_void, ptr::NonNull, slice};
+use std::{
+    ffi::{c_void, CStr},
+    mem::size_of,
+    ptr::NonNull,
+    slice,
+};
 
 use qemu_api::{
     bindings::{
-- 
2.49.0



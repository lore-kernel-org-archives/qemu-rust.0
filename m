Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3C-0003PD-Gi
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ39-0003NE-Qz
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ33-0001xg-1a
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Fu9qvACQbuwh95JzWOQa80TwLOYjoE9iF7rJ1YNRcg=;
 b=JPDcpLzHuPg8KGbYtEcXl3ewsYfNVWN8MSt8R1NKKN4mEkuevvRTurL99VJHJ/mO93kycD
 8heiXkKPcS0WoyLDb0iEd/QnvjRFx+QrSDB9+acr3O4xJm1vC1nDZmyAaMGtgPOzb23B4q
 NJhwzrMFo4NpEBV93RT041ZLeQbmOIc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-RLrbuhVQNx-90int7Io7sQ-1; Mon, 30 Dec 2024 19:23:44 -0500
X-MC-Unique: RLrbuhVQNx-90int7Io7sQ-1
X-Mimecast-MFC-AGG-ID: RLrbuhVQNx-90int7Io7sQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e3cbf308so3773661f8f.2
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604624; x=1736209424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Fu9qvACQbuwh95JzWOQa80TwLOYjoE9iF7rJ1YNRcg=;
 b=jDmv4X3LdBDvHq5g5W9lZo6eYHORhhdYuj/VYCECcKfy+gyZ0D81fj4PsPQgk1Aqoc
 YMz2gvMggVHGuXTgumdN6G9uzXYH0et4EpbZicKixnuUH52MXb7ZKff5XjMbd8C2eXp7
 mVv2HkeGHlrTcSV2O0M1RxCGXGyCzAyW4vfakX3kIuUZULOqW50GGz774rvDxsLBJQoB
 CFS4zrGDVCHMbUVwc9vwf8M0ncpEuw26lJHHlwZq5xkKE8brnvMQzywGXmEGTsnu2d3f
 +PlC+gDRUyvj4N4kRPTUNgf8+aO+BtTAICOusHjUTnkCSUBpJzTSFFJ0dw8fhSPWnHnl
 arlg==
X-Gm-Message-State: AOJu0YyRRVCxVJnydMGB46FwGJN2m6VW9MUjyagwWB4ESOxjlwVGhcMX
 9oFpFJ5Txi6Ocz7komKPqbTSHZly5EB7EMxNZ40Zc7lkyErbLxYE23L5ukAHnTudmXefGVcnVln
 cZmsrWeoYNCIs5ZPRWJ0FPFJ+gaR8RkuMi/dYkBMkTx201KYlD/0=
X-Gm-Gg: ASbGncs/Xzibuv1iiSBBH/9mzoVuoLRpQDK8kwTY7VlN8d6fFNvSbPBU5Vzq/NeTsXH
 9o1cBSgKmAgWM6tvdNnEJP4t9ytRbzfh+K9D9Ftp6K4POR6jLUyzOV0zWtM7HJIkfrmgY0Ro++V
 8wZjTBU9l/c+hd+ip9eWuigZSpL/aG/acOZhKdZBE7Rsvr0g2faahdLAD5dKSC7Om/Pu/iOEHVT
 7mw6o1hmtdPQWnwfMQeGtF939k+Fsd16mKm5PcPdr8YTtrMRDPe1ATbKEQ=
X-Received: by 2002:a05:6000:154d:b0:386:3e3c:ef1 with SMTP id
 ffacd0b85a97d-38a221fe106mr36711152f8f.35.1735604623732; 
 Mon, 30 Dec 2024 16:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkX0qw5aMnHDsAZCYl2xPPTUYBILaP+RU6Wv1Q5eGQxDredEQO8S1d7G6wVi3LI9tOOJR0fw==
X-Received: by 2002:a05:6000:154d:b0:386:3e3c:ef1 with SMTP id
 ffacd0b85a97d-38a221fe106mr36711138f8f.35.1735604623358; 
 Mon, 30 Dec 2024 16:23:43 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828f5fsm31710670f8f.8.2024.12.30.16.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:23:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 2/9] rust: vmstate: implement VMState for non-leaf types
Date: Tue, 31 Dec 2024 01:23:29 +0100
Message-ID: <20241231002336.25931-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231002336.25931-1-pbonzini@redhat.com>
References: <20241231002336.25931-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pG5uiLdNBiy1zwzlX4PyEvvMkJHv9V2TVpaDTiqCnm8_1735604624
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.187,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Dec 2024 00:23:57 -0000

Arrays, pointers and cells use a VMStateField that is based on that
for the inner type.  The implementation therefore delegates to the
VMState implementation of the inner type.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 66 +++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index bfcf06e8f1d..e20f27b172b 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -19,8 +19,9 @@
 //!   `include/migration/vmstate.h`. These are not type-safe and should not be
 //!   used if the equivalent functionality is available with `vmstate_of!`.
 
-use core::marker::PhantomData;
+use core::{marker::PhantomData, mem, ptr::NonNull};
 
+use crate::bindings::VMStateFlags;
 pub use crate::bindings::{VMStateDescription, VMStateField};
 
 /// This macro is used to call a function with a generic argument bound
@@ -108,6 +109,69 @@ pub const fn with_version_id(mut self, version_id: i32) -> Self {
         self.version_id = version_id;
         self
     }
+
+    #[must_use]
+    pub const fn with_array_flag(mut self, num: usize) -> Self {
+        assert!(num <= 0x7FFF_FFFFusize);
+        assert!((self.flags.0 & VMStateFlags::VMS_ARRAY.0) == 0);
+        if (self.flags.0 & VMStateFlags::VMS_POINTER.0) != 0 {
+            self.flags = VMStateFlags(self.flags.0 & !VMStateFlags::VMS_POINTER.0);
+            self.flags = VMStateFlags(self.flags.0 | VMStateFlags::VMS_ARRAY_OF_POINTER.0);
+        }
+        self.flags = VMStateFlags(self.flags.0 & !VMStateFlags::VMS_SINGLE.0);
+        self.flags = VMStateFlags(self.flags.0 | VMStateFlags::VMS_ARRAY.0);
+        self.num = num as i32;
+        self
+    }
+
+    #[must_use]
+    pub const fn with_pointer_flag(mut self) -> Self {
+        assert!((self.flags.0 & VMStateFlags::VMS_POINTER.0) == 0);
+        self.flags = VMStateFlags(self.flags.0 | VMStateFlags::VMS_POINTER.0);
+        self
+    }
+}
+
+// Transparent wrappers: just use the internal type
+
+macro_rules! impl_vmstate_transparent {
+    ($type:ty where $base:tt: VMState $($where:tt)*) => {
+        unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
+            const BASE: VMStateField = VMStateField {
+                size: mem::size_of::<$type>(),
+                ..<$base as VMState>::BASE
+            };
+        }
+    };
+}
+
+impl_vmstate_transparent!(std::cell::Cell<T> where T: VMState);
+impl_vmstate_transparent!(std::cell::UnsafeCell<T> where T: VMState);
+impl_vmstate_transparent!(crate::cell::BqlCell<T> where T: VMState);
+impl_vmstate_transparent!(crate::cell::BqlRefCell<T> where T: VMState);
+
+// Pointer types using the underlying type's VMState plus VMS_POINTER
+
+macro_rules! impl_vmstate_pointer {
+    ($type:ty where $base:tt: VMState $($where:tt)*) => {
+        unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
+            const SCALAR_TYPE: VMStateFieldType = <T as VMState>::SCALAR_TYPE;
+            const BASE: VMStateField = <$base as VMState>::BASE.with_pointer_flag();
+        }
+    };
+}
+
+impl_vmstate_pointer!(*const T where T: VMState);
+impl_vmstate_pointer!(*mut T where T: VMState);
+impl_vmstate_pointer!(NonNull<T> where T: VMState);
+impl_vmstate_pointer!(Option<NonNull<T>> where T: VMState);
+
+// Arrays using the underlying type's VMState plus
+// VMS_ARRAY/VMS_ARRAY_OF_POINTER
+
+unsafe impl<T: VMState, const N: usize> VMState for [T; N] {
+    const SCALAR_TYPE: VMStateFieldType = <T as VMState>::SCALAR_TYPE;
+    const BASE: VMStateField = <T as VMState>::BASE.with_array_flag(N);
 }
 
 #[doc(alias = "VMSTATE_UNUSED_BUFFER")]
-- 
2.47.1



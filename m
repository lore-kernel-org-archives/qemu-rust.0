Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCt-0001eb-2i
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCp-0001ah-4U
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCf-0002D4-DS
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tB+0wLdGKfYjOO1CK7DKuiSRMJWw6EIiF2Kmen84UhQ=;
 b=JnX8NQAG+QKn8VqB9fdfG12Y8Is2JPhM0B2fGz5MhQXz4FVI8Elfuxi8U4cR3YCY6chaUq
 AlRa0hFKeeDiRGVgR+dduO+gBrsAV8ltBZuSCfV4E8hr6cnidr9V2tu8qCBZQExvG+ZdWk
 l7TCbraLmZxz8aasjj3cVBkqfh2hUtI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-83xFhIilNPmiBF9pKcyvTg-1; Fri, 17 Jan 2025 14:40:22 -0500
X-MC-Unique: 83xFhIilNPmiBF9pKcyvTg-1
X-Mimecast-MFC-AGG-ID: 83xFhIilNPmiBF9pKcyvTg
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5d3ff3c1b34so3302974a12.1
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142821; x=1737747621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tB+0wLdGKfYjOO1CK7DKuiSRMJWw6EIiF2Kmen84UhQ=;
 b=gbWcGoTHKwwQ0oLSe2RlwhLOp9hMsJGVNmNn5bk+tx9DvpDGqOpulwQdkYNO8pZOdy
 23c/bjcGya581cUcRAjw2xNvVlVj1/hpbnJuPE8NvURR4ctyP7QiciClQhXpvVLFtqzd
 3MtO+SQX1kMzMcnTv8xPzU1qttalFuUV0pzWBlx4z/QTOFMG+5yO9cuyhcKjR8ZUbz7O
 M+a5hQ8lTXaCZx/Fo7PN01s5iQHfBZIIi3zZP32GK5nzd6tQhOIHWfY7wTeuWO2HR/v5
 7WhwPqbga432SaJaFDa/ojRgCmCmviBfLG1/LT5sz7BLk7g47qxBf2FEIBhS7PCKWd8T
 ujig==
X-Gm-Message-State: AOJu0YzY1k+wogBwZ4OopMRidqf6MFyYiTKd1AU56WecBTwpNKJcWPC/
 kGEx5Hht6wiprDXVK3qrqVwEHS41fjUC07FiXhHJU15V+K2UIR2DN+uSP3BkpL7BxtKplJ5G2NQ
 gk2Co9oSOwMxXJdRR6XxhgleD5HyetY0feISXO+eOx8QaQv0vYZJLd0G2w/xogQ==
X-Gm-Gg: ASbGnct8c1Zo4y06gldWh97i4ILPtQDHlLUBW7j4zkeocj6sZxlmo+lmcJDLKgpYwEE
 WqMMxqOiYNTQ6h3vKBdnSjoACl6W2eWVhMaUh4z/h+MBGG8EC82FdHLfviF98JojqjORmzBI3SE
 9QR58KK4ENJBK3Prp1YKMzI46EuVQJ3phRA12nRiBOOvgJf+X1ZVMKfjbTCxS9fICBo5kkMxHkw
 HAsPOwqICyy8594rgl5pSfC6G6MULs0ItfJsWG52I9nJ9vaUyiTe494SYgeGQ==
X-Received: by 2002:a05:6402:2342:b0:5db:67a7:e742 with SMTP id
 4fb4d7f45d1cf-5db7d2f947dmr3591156a12.8.1737142820924; 
 Fri, 17 Jan 2025 11:40:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbHfDaPZvPVis45W8G4jtQRMfhXqK0bY0Sa1dU3kx3iXc5jJ4dYg7FVyd2EaIFIN225cnciQ==
X-Received: by 2002:a05:6402:2342:b0:5db:67a7:e742 with SMTP id
 4fb4d7f45d1cf-5db7d2f947dmr3591134a12.8.1737142820549; 
 Fri, 17 Jan 2025 11:40:20 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73642580sm1910393a12.15.2025.01.17.11.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 06/10] rust: qom: allow initializing interface vtables
Date: Fri, 17 Jan 2025 20:39:59 +0100
Message-ID: <20250117194003.1173231-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117194003.1173231-1-pbonzini@redhat.com>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r3HR-Ra1S70G-uKe1xudRVhtUuIl6ttTEVp3C9_WKYA_1737142821
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:35 -0000

Unlike regular classes, interface vtables can only be obtained via
object_class_dynamic_cast.  Provide a wrapper that allows accessing
the vtable and pass it to a ClassInitImpl implementation, for example
ClassInitImpl<ResettableClass>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/prelude.rs |  1 +
 rust/qemu-api/src/qom.rs     | 45 ++++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/rust/qemu-api/src/prelude.rs b/rust/qemu-api/src/prelude.rs
index 87e3ce90f26..254edb476dd 100644
--- a/rust/qemu-api/src/prelude.rs
+++ b/rust/qemu-api/src/prelude.rs
@@ -9,6 +9,7 @@
 
 pub use crate::qdev::DeviceMethods;
 
+pub use crate::qom::InterfaceType;
 pub use crate::qom::IsA;
 pub use crate::qom::Object;
 pub use crate::qom::ObjectCast;
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 6f7db3eabcb..8b2dbb3919c 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -66,8 +66,8 @@
 
 use crate::{
     bindings::{
-        self, object_dynamic_cast, object_get_class, object_get_typename, object_new, object_ref,
-        object_unref, TypeInfo,
+        self, object_class_dynamic_cast, object_dynamic_cast, object_get_class,
+        object_get_typename, object_new, object_ref, object_unref, TypeInfo,
     },
     cell::bql_locked,
 };
@@ -256,6 +256,47 @@ unsafe fn as_object_mut_ptr(&self) -> *mut Object {
     }
 }
 
+/// Trait exposed by all structs corresponding to QOM interfaces.
+/// Unlike `ObjectType`, it is implemented on the class type (which provides
+/// the vtable for the interfaces).
+///
+/// # Safety
+///
+/// `TYPE` must match the contents of the `TypeInfo` as found in the C code;
+/// right now, interfaces can only be declared in C.
+pub unsafe trait InterfaceType: Sized {
+    /// The name of the type, which can be passed to
+    /// `object_class_dynamic_cast()` to obtain the pointer to the vtable
+    /// for this interface.
+    const TYPE_NAME: &'static CStr;
+
+    /// Initialize the vtable for the interface; the generic argument `T` is the
+    /// type being initialized, while the generic argument `U` is the type that
+    /// lists the interface in its `TypeInfo`.
+    ///
+    /// # Panics
+    ///
+    /// Panic if the incoming argument if `T` does not implement the interface.
+    fn interface_init<
+        T: ObjectType + ClassInitImpl<Self> + ClassInitImpl<U::Class>,
+        U: ObjectType,
+    >(
+        klass: &mut U::Class,
+    ) {
+        unsafe {
+            // SAFETY: upcasting to ObjectClass is always valid, and the
+            // return type is either NULL or the argument itself
+            let result: *mut Self = object_class_dynamic_cast(
+                (klass as *mut U::Class).cast(),
+                Self::TYPE_NAME.as_ptr(),
+            )
+            .cast();
+
+            <T as ClassInitImpl<Self>>::class_init(result.as_mut().unwrap())
+        }
+    }
+}
+
 /// This trait provides safe casting operations for QOM objects to raw pointers,
 /// to be used for example for FFI. The trait can be applied to any kind of
 /// reference or smart pointers, and enforces correctness through the [`IsA`]
-- 
2.47.1



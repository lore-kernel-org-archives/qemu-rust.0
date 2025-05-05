Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBrlz-0004Mh-0X
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrl5-0003dn-O0
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrl1-0005mj-4H
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746435902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=id8u6QhmytdWjNgsDYLCFHIvJVm+T0ExWvUr0aO33CQ=;
 b=d/Aca1tu3wx9oG8WhFqNXDOsvA3XXzpPenglHO3JzKxNydKyONhyA4yDwt2jNcoVJK0uZy
 3rz9GKT7wQPi3b90SSNi0RN949lpbpa6KWAXKuLDxM+Dcjv1ekYiXgjSWqt3LSSzEzEv4K
 LZur4JvvZZGQ33PFDj4YJbzZPeP5JqE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-qHv3RYmoNq26AU3VC_lj0w-1; Mon, 05 May 2025 05:05:01 -0400
X-MC-Unique: qHv3RYmoNq26AU3VC_lj0w-1
X-Mimecast-MFC-AGG-ID: qHv3RYmoNq26AU3VC_lj0w_1746435900
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso21829415e9.0
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435899; x=1747040699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=id8u6QhmytdWjNgsDYLCFHIvJVm+T0ExWvUr0aO33CQ=;
 b=t/NztojenL45KZ8rexIe4HMTLO7weEk8L74lSAi291odSCVXvultf+Jo1Tabj3+NTG
 jOeafb7glsI75LkIU5cGIB49E81NWWMg0h2Cv3CuDg5PJFBB0yno0ykjNMpmwb6rh8f+
 rUuT9yWN+JscS77OeSmu5QiEzwOJXtQZeAohv0C2o0iRmAp1lMioreel8jEn2fplUL9V
 ONsUsGe7EWjYrrFfBzFiSlG7PqKpv+eKRsFP47Ujs38dvV9WR7Hqr3D1qCz49fQu+TkP
 ssynBN63MuOfWmyceqy0txQA4pfkVoQR2/za8Yg0G23UiBQXnXRdawCMZqlqWmacvzcC
 4TwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlXliRQt1wJlyHoVi1UbEmQgZAvHWBN2hVT4IceOe5ZbPetRLu8HADKw7H/PVydNUqoffPVVPXdO4=@nongnu.org
X-Gm-Message-State: AOJu0YwlHEvDcXtGDiDH9m3eDRTXP/tQbquz25O1FxJOnmA0h548ScKc
 zGIR513F7tB4B3a+7lE6OZnaUHEUzhKPl1JaB4CbefcpFh+EL5wxsS/GxSoFP7ekVLNwTXVFDE7
 T6HJ/CrFvx0Nz96aWc8HjOoquHk15szAhaxWTEU7a9h1ppSafa5xx8zgNtyg=
X-Gm-Gg: ASbGncs4VSj//YgnF8QVfn3a4zRd1irliR6s8iRf8CxUgGk9M66rWO5WKB3thSKg/wu
 b9AJJ8kYSJ92pUDPQVKvuDniuHt8VFeZqCMSBW72KQci/tT1xyi8w8lEtDfEk6QlYZD+0928YuO
 iJZ5xTkDpKUi8WHLLKOPFCF7CUd8Eg42wWPCrzBs1pldpztR8MvYTiE3qmcsFNGPG6/FcqdrLMb
 uk1hvyA2ioPsGkifH5TK4FgeX/mHeWY4SugQUy/fQ17zHoKadFs12bE7Qo0bB2FX7ZxGrXA55ea
 I9ICfHUw2E0czrs=
X-Received: by 2002:a05:600c:4f4b:b0:440:67f8:7589 with SMTP id
 5b1f17b1804b1-441c1cfc6c8mr71133155e9.16.1746435899361; 
 Mon, 05 May 2025 02:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ6NOxdsH59R7JFTF2kUdGip0Iis2Q67GL5v7Psp95zL1DwgV1RUtFu6Osg0DlYadflkPw5Q==
X-Received: by 2002:a05:600c:4f4b:b0:440:67f8:7589 with SMTP id
 5b1f17b1804b1-441c1cfc6c8mr71132845e9.16.1746435898986; 
 Mon, 05 May 2025 02:04:58 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc441sm128821855e9.3.2025.05.05.02.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:04:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 08/11] rust: enable clippy::ptr_cast_constness
Date: Mon,  5 May 2025 11:04:33 +0200
Message-ID: <20250505090438.24992-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505090438.24992-1-pbonzini@redhat.com>
References: <20250505090438.24992-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LNUh27XYHrihjOIQtUipdtunikGtnxIpQK-y3FePEn4_1746435900
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 05 May 2025 09:05:13 -0000

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst            | 2 --
 rust/Cargo.toml                | 2 +-
 rust/hw/timer/hpet/src/hpet.rs | 2 +-
 rust/qemu-api/src/cell.rs      | 2 +-
 rust/qemu-api/src/chardev.rs   | 2 +-
 rust/qemu-api/src/qom.rs       | 4 ++--
 rust/qemu-api/src/timer.rs     | 2 +-
 7 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 13a002cfe69..a315f668865 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -74,8 +74,6 @@ Supported tools
 QEMU supports rustc version 1.63.0 and newer.  Notably, the following features
 are missing:
 
-* ``cast_mut()``/``cast_const()`` (1.65.0).  Use ``as`` instead.
-
 * Generic Associated Types (1.65.0)
 
 * ``CStr::from_bytes_with_nul()`` as a ``const`` function (1.72.0).
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index eda7980b31a..a328634d949 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -71,6 +71,7 @@ no_effect_underscore_binding = "deny"
 option_option = "deny"
 or_fun_call = "deny"
 ptr_as_ptr = "deny"
+ptr_cast_constness = "deny"
 pub_underscore_fields = "deny"
 redundant_clone = "deny"
 redundant_closure_for_method_calls = "deny"
@@ -92,7 +93,6 @@ used_underscore_binding = "deny"
 
 # nice to have, but cannot be enabled yet
 #wildcard_imports = "deny"   # still have many bindings::* imports
-#ptr_cast_constness = "deny" # needs 1.65.0 for cast_mut()/cast_const()
 
 # these may have false positives
 #option_if_let_else = "deny"
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index d4364f2f2f7..b7a1be05deb 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -219,7 +219,7 @@ fn init(&mut self, index: u8, state: &HPETState) {
             // SAFETY: the HPETTimer will only be used after the timer
             // is initialized below.
             qemu_timer: unsafe { Timer::new() },
-            state: NonNull::new(state as *const _ as *mut _).unwrap(),
+            state: NonNull::new((state as *const HPETState).cast_mut()).unwrap(),
             config: 0,
             cmp: 0,
             fsb: 0,
diff --git a/rust/qemu-api/src/cell.rs b/rust/qemu-api/src/cell.rs
index ab0785a2692..1cb9fdcd53f 100644
--- a/rust/qemu-api/src/cell.rs
+++ b/rust/qemu-api/src/cell.rs
@@ -1016,7 +1016,7 @@ pub const fn as_mut_ptr(&self) -> *mut T {
 
     /// Returns a raw pointer to the opaque data.
     pub const fn as_ptr(&self) -> *const T {
-        self.as_mut_ptr() as *const _
+        self.as_mut_ptr().cast_const()
     }
 
     /// Returns a raw pointer to the opaque data that can be passed to a
diff --git a/rust/qemu-api/src/chardev.rs b/rust/qemu-api/src/chardev.rs
index 146a4852da3..6e0590d758e 100644
--- a/rust/qemu-api/src/chardev.rs
+++ b/rust/qemu-api/src/chardev.rs
@@ -160,7 +160,7 @@ pub fn enable_handlers<
                 receive_cb,
                 event_cb,
                 None,
-                (owner as *const T as *mut T).cast::<c_void>(),
+                (owner as *const T).cast_mut().cast::<c_void>(),
                 core::ptr::null_mut(),
                 true,
             );
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 52e3a1ec981..41e5a5e29a8 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -388,7 +388,7 @@ fn as_mut_ptr<U: ObjectType>(&self) -> *mut U
     {
         #[allow(clippy::as_ptr_cast_mut)]
         {
-            self.as_ptr::<U>() as *mut _
+            self.as_ptr::<U>().cast_mut()
         }
     }
 }
@@ -638,7 +638,7 @@ pub unsafe fn from_raw(ptr: *const T) -> Self {
         // SAFETY NOTE: while NonNull requires a mutable pointer, only
         // Deref is implemented so the pointer passed to from_raw
         // remains const
-        Owned(NonNull::new(ptr as *mut T).unwrap())
+        Owned(NonNull::new(ptr.cast_mut()).unwrap())
     }
 
     /// Obtain a raw C pointer from a reference.  `src` is consumed
diff --git a/rust/qemu-api/src/timer.rs b/rust/qemu-api/src/timer.rs
index d697fd742bc..868bd88575f 100644
--- a/rust/qemu-api/src/timer.rs
+++ b/rust/qemu-api/src/timer.rs
@@ -81,7 +81,7 @@ pub fn init_full<'timer, 'opaque: 'timer, T, F>(
                 scale as c_int,
                 attributes as c_int,
                 Some(timer_cb),
-                (opaque as *const T).cast::<c_void>() as *mut c_void,
+                (opaque as *const T).cast::<c_void>().cast_mut(),
             )
         }
     }
-- 
2.49.0



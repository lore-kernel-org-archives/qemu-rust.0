Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9085060A261C
	for <qemu-rust@archiver.kernel.org>; Fri, 20 Nov 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dvoxtvKT
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xUO3k-0000t9-9C; Fri, 20 Nov 2026 07:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xUO3h-0000rh-La
 for qemu-rust@nongnu.org; Fri, 20 Nov 2026 07:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xUO3f-0004m5-Je
 for qemu-rust@nongnu.org; Fri, 20 Nov 2026 07:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795178978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSwHL3vuTndJi148C85zSTNoHuO+rSDLC00laMooOgM=;
 b=dvoxtvKTfirHlBr2tR0+7u+haEgybGZFlj/NbEykQNSW/rmLIfRsBp1hhTOz1mIs14+Sps
 VMQ9tu6C0E7qwgRy3ldMHM+3RNoay8saQkW7aR1ApF/mnlMR9ERTRyc+e99Xmfk/cCBNyD
 KfpsvXH+tzkG8qTPyKXHvImqB+7Nw8U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-4iHcKREQM4GoR2HWLc8OwA-1; Fri, 20 Nov 2026 12:49:37 +0000
X-MC-Unique: 4iHcKREQM4GoR2HWLc8OwA-1
X-Mimecast-MFC-AGG-ID: 4iHcKREQM4GoR2HWLc8OwA_1795178977
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f5844cb60so168110285a.0
 for <qemu-rust@nongnu.org>; Fri, 20 Nov 2026 04:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795178977; x=1795783777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uSwHL3vuTndJi148C85zSTNoHuO+rSDLC00laMooOgM=;
 b=n7he+uUVbzwhDV3+EuPsKZDuYZanBh+9dJ4vz9AMz1YL9c8Zk4lnHR6x0kkCzHi3y2
 TArBd3WOVQutjXbgaRMeqdJC4lSMRlmGWBFgrSSAIzQet+52GMvQ/ac/gpP4mmmSdQg1
 2rOHzadroJq3phqcxKn23eCkVHkI1kLaDNBXZoF11Jf4HfIW0Hfqpcz7MN+aA3UfQjid
 foMlrSRgLMrTeNY+dob0tuGrlcXO5EAUfwCnUNpwVxYRp1xcUuOmj56LMDQmrBgHnK8O
 PPqG2AmqWuBBwcLE/kMKo7Cqxnvoqvq4BU7Kzn3zQKIOC58ql307QdN1tLF+FLofV7xs
 o2+Q==
X-Forwarded-Encrypted: i=1;
 AL+hErE8YpMf53yfB3YuslQoP79UqEbSM941JqAgDM6lWX5YwTJk0VljDBUzV46s05z5b8PngFlPppZ9lmY=@nongnu.org
X-Gm-Message-State: APuU4Z9oWaw1omRxHyOd1fI6NyGdCRwswPqfBrMPqEwtUw4g9UHJzp4m
 htPhZsUb4QpQVK0iVq07NRXHnZxXzMxP7fhrVBQ0bopWRdINCzBnIOihxjvjKTsKFizMtSv2BbT
 6CVcMfIYBCXBl3BrixCyz/u2sY7CrogyRyOu5mBXX7jaI1LfX9U29M2c=
X-Gm-Gg: AYBFou1ANE69KEt3DdiwTHfxJRazP5uE+fEqqnO2GLnoJdT+ZivOL3VS3qrdqSu56dK
 59jXn/HXpUSNi+gvGN/CdCHywQaeqj6JXjKlOjUbuZ9VgtiHUzZBkxDYx7uHa5RH8besJ11mlF0
 OEAS4+09dtnMsyF6rFsFxm7DaV6V6pnJNrWNcQPGGV3ucNKPN8A09hTW/Rls2K0vfTLjMGJczIU
 J9w3yjo4KgOle7lcnTOy32ZiaEIhyL5OONZC/xpOcdGwcIyBvf7gepRpNza5uoeJJHLmRBLSfni
 HZ2h+jZos1tYVyaj0B+hwvFh6Nl2tXhqzuGzEzXl7KdNMFXa2XvzFaJHAzOe5e/oq5+PlWrkFSQ
 kXeAs8zLEvtxYSSaCQ6KnYhNSI7zoZaaULQjikpIQrCCT
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id
 af79cd13be357-949b35ac8e0mr694778685a.19.1795178976551; 
 Fri, 20 Nov 2026 04:49:36 -0800 (PST)
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id
 af79cd13be357-949b35ac8e0mr694762985a.19.1795178974274; 
 Fri, 20 Nov 2026 04:49:34 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb397b4bsm181805685a.21.2026.11.20.04.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 04:49:33 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 peterx@redhat.com, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH for-12.0 5/6] rust: Replace vmstate_validate with post_load
Date: Fri, 20 Nov 2026 07:49:22 -0500
Message-ID: <20261120124923.1656220-6-peterx@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120124923.1656220-1-peterx@redhat.com>
References: <20261120124923.1656220-1-peterx@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9cJbkz-VuJ0Gq8DaJkQG_fDiJjalJxd0pwJE0zwf3Qg_1795178977
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We dropped all of that in C, drop that in Rust too.  The goal is to remove
the VMSTATE_VALIDATE() together with VMS_MUST_EXIST.

Use post_load instead for the check.

Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-rust@nongnu.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs  |  9 ++--
 rust/migration/src/prelude.rs     |  1 -
 rust/migration/src/vmstate.rs     | 17 -------
 rust/tests/tests/vmstate_tests.rs | 77 -------------------------------
 4 files changed, 5 insertions(+), 99 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 89ba7a5c4d..da0540f528 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -934,10 +934,14 @@ fn pre_save(&self) -> Result<(), migration::Infallible> {
         Ok(())
     }
 
-    fn post_load(&self, _version_id: u8) -> Result<(), migration::Infallible> {
+    fn post_load(&self, version_id: u8) -> Result<(), migration::InvalidError> {
         let mut regs = self.regs.borrow_mut();
         let cnt = regs.counter;
 
+        if !self.validate_num_timers(version_id) {
+            return Err(migration::InvalidError);
+        }
+
         for tn_regs in regs.tn_regs.iter_mut().take(self.num_timers) {
             tn_regs.update_cmp64(cnt);
             tn_regs.last = CLOCK_VIRTUAL.get_ns() - NANOSECONDS_PER_SECOND;
@@ -1082,8 +1086,6 @@ fn restore_migrated_state(
 
 impl_vmstate_struct!(HPETTimerMigration, VMSTATE_HPET_TIMER);
 
-const VALIDATE_TIMERS_NAME: &CStr = c"num_timers must match";
-
 // HPETRegistersMigration is generated by ToMigrationState macro.
 impl_vmstate_struct!(
     HPETRegistersMigration,
@@ -1109,7 +1111,6 @@ fn restore_migrated_state(
         .fields(vmstate_fields! {
             vmstate_of!(HPETState, regs),
             vmstate_of!(HPETState, num_timers_save),
-            vmstate_validate!(HPETState, VALIDATE_TIMERS_NAME, HPETState::validate_num_timers),
             vmstate_of!(HPETState, timers[0 .. num_timers_save], HPETState::validate_num_timers).with_version_id(0),
         })
         .subsections(vmstate_subsections!(
diff --git a/rust/migration/src/prelude.rs b/rust/migration/src/prelude.rs
index 797e7ec59d..e2cbbda43e 100644
--- a/rust/migration/src/prelude.rs
+++ b/rust/migration/src/prelude.rs
@@ -16,4 +16,3 @@
 pub use crate::vmstate_of;
 pub use crate::vmstate_subsections;
 pub use crate::vmstate_unused;
-pub use crate::vmstate_validate;
diff --git a/rust/migration/src/vmstate.rs b/rust/migration/src/vmstate.rs
index 5ed061f2ab..0c8b92f9d6 100644
--- a/rust/migration/src/vmstate.rs
+++ b/rust/migration/src/vmstate.rs
@@ -372,23 +372,6 @@ macro_rules! vmstate_fields {
     }}
 }
 
-#[doc(alias = "VMSTATE_VALIDATE")]
-#[macro_export]
-macro_rules! vmstate_validate {
-    ($struct_name:ty, $test_name:expr, $test_fn:expr $(,)?) => {
-        $crate::bindings::VMStateField {
-            name: ::std::ffi::CStr::as_ptr($test_name),
-            field_exists: $crate::vmstate_exist_fn!($struct_name, $test_fn),
-            flags: $crate::bindings::VMStateFlags(
-                $crate::bindings::VMStateFlags::VMS_MUST_EXIST.0
-                    | $crate::bindings::VMStateFlags::VMS_NO_STATE.0,
-            ),
-            num: 0, // 0 elements: no data, only run test_fn callback
-            ..::common::zeroable::Zeroable::ZERO
-        }
-    };
-}
-
 /// Helper macro to allow using a struct in [`vmstate_of!`]
 ///
 /// # Safety
diff --git a/rust/tests/tests/vmstate_tests.rs b/rust/tests/tests/vmstate_tests.rs
index 6578d54b37..f4db02abac 100644
--- a/rust/tests/tests/vmstate_tests.rs
+++ b/rust/tests/tests/vmstate_tests.rs
@@ -406,80 +406,3 @@ fn test_vmstate_macro_array_of_pointer_wrapped() {
     // The last VMStateField in VMSTATE_FOOC.
     assert_eq!(foo_fields[4].flags, VMStateFlags::VMS_END);
 }
-
-// =========================== Test VMSTATE_FOOD ===========================
-// Test the use cases of the vmstate macro, corresponding to the following C
-// macro variants:
-//   * VMSTATE_FOOD:
-//     - VMSTATE_VALIDATE
-
-// Add more member fields when vmstate_of support "test" parameter.
-struct FooD;
-
-impl FooD {
-    fn validate_food_0(&self, _version_id: u8) -> bool {
-        true
-    }
-
-    fn validate_food_1(_state: &FooD, _version_id: u8) -> bool {
-        false
-    }
-}
-
-fn validate_food_2(_state: &FooD, _version_id: u8) -> bool {
-    true
-}
-
-static VMSTATE_FOOD: VMStateDescription<FooD> = VMStateDescriptionBuilder::<FooD>::new()
-    .name(c"foo_d")
-    .version_id(3)
-    .minimum_version_id(1)
-    .fields(vmstate_fields! {
-        vmstate_validate!(FooD, c"foo_d_0", FooD::validate_food_0),
-        vmstate_validate!(FooD, c"foo_d_1", FooD::validate_food_1),
-        vmstate_validate!(FooD, c"foo_d_2", validate_food_2),
-    })
-    .build();
-
-#[test]
-fn test_vmstate_validate() {
-    let foo_fields: &[VMStateField] =
-        unsafe { slice::from_raw_parts(VMSTATE_FOOD.as_ref().fields, 4) };
-    let mut foo_d = FooD;
-    let foo_d_p = std::ptr::addr_of_mut!(foo_d).cast::<c_void>();
-
-    // 1st VMStateField in VMSTATE_FOOD
-    assert_eq!(
-        unsafe { CStr::from_ptr(foo_fields[0].name) }.to_bytes_with_nul(),
-        b"foo_d_0\0"
-    );
-    assert_eq!(foo_fields[0].offset, 0);
-    assert_eq!(foo_fields[0].num_indirect.size, 0);
-    assert!(foo_fields[0].info.is_null());
-    assert_eq!(foo_fields[0].version_id, 0);
-    assert_eq!(foo_fields[0].size, 0);
-    assert_eq!(foo_fields[0].num, 0);
-    assert_eq!(
-        foo_fields[0].flags.0,
-        VMStateFlags::VMS_NO_STATE.0 | VMStateFlags::VMS_MUST_EXIST.0
-    );
-    assert!(foo_fields[0].vmsd.is_null());
-    assert!(unsafe { foo_fields[0].field_exists.unwrap()(foo_d_p, 0) });
-
-    // 2nd VMStateField in VMSTATE_FOOD
-    assert_eq!(
-        unsafe { CStr::from_ptr(foo_fields[1].name) }.to_bytes_with_nul(),
-        b"foo_d_1\0"
-    );
-    assert!(!unsafe { foo_fields[1].field_exists.unwrap()(foo_d_p, 1) });
-
-    // 3rd VMStateField in VMSTATE_FOOD
-    assert_eq!(
-        unsafe { CStr::from_ptr(foo_fields[2].name) }.to_bytes_with_nul(),
-        b"foo_d_2\0"
-    );
-    assert!(unsafe { foo_fields[2].field_exists.unwrap()(foo_d_p, 2) });
-
-    // The last VMStateField in VMSTATE_FOOD.
-    assert_eq!(foo_fields[3].flags, VMStateFlags::VMS_END);
-}
-- 
2.56.0



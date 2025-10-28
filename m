Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A61CCF9E0
	for <qemu-rust@archiver.kernel.org>; Tue, 28 Oct 2025 11:38:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vDi2C-0007or-Ik; Tue, 28 Oct 2025 07:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDi29-0007o9-BX
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 07:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDi25-0004uv-IC
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 07:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761651506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a574bfKXPLraHbw9jj5peIvYFBrcTFaJN0NoFwezcZA=;
 b=aVILheBDoz5paWEK8WR84ZCE+1erw7IkbNpBFe/Bo4pfFVXaFGfVVj8oOaLa0KV8HXw5Qv
 UW/qe0d11bXzpltyHTw1bkZ45339f3t0yAlPjM2efAywzHpBAilV4fj6TX3+TP98Nujdco
 YGjxzd1YZ/RATgt0YKC6LPJ1bJb8al4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-7fvStUsiPIS66mRDLYNgUA-1; Tue, 28 Oct 2025 07:38:25 -0400
X-MC-Unique: 7fvStUsiPIS66mRDLYNgUA-1
X-Mimecast-MFC-AGG-ID: 7fvStUsiPIS66mRDLYNgUA_1761651504
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477171bbf51so4871795e9.3
 for <qemu-rust@nongnu.org>; Tue, 28 Oct 2025 04:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761651503; x=1762256303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a574bfKXPLraHbw9jj5peIvYFBrcTFaJN0NoFwezcZA=;
 b=FLUjrPOMd2AblTd9mkgzq63XrMxALf6hkXgc4K/u6ABMqgW8+Yo4RFt3NILdVYnjFb
 ygt3UoIcT/DFMV0LaxMVmAbRdoClYqBLNzqRdkjhUHIqHB5Lv5oHL5Hh2qA/dWCqARaI
 3MP9Wu8XQqPMHBEZmyxB7W44ng8P42F4+QRvhsfy4aI1Ib11GnzZ1e3YvacTWv2h8d0P
 eMOrZOJwrUmi7kS1vjWlz1bXIIPtRxKepnuyifc4oNxn3+P1LopVOCobWbsFC7uGWHov
 BEMHjqa+6Tu2dy7HOh5mve0fIjdMaiE2aFM+dFqGH06NVt389mxppVD4AwYAcKRa3p2o
 LQYg==
X-Gm-Message-State: AOJu0YxJSPlaQgOdHGaL99fUTjLvma83uCA7gbtfYVM68E2bXMUiz0Da
 ZWX0JK/6eUMXkAFggSIGihZe1tTpHZxFDEPLkiwJGQncEDbY/mAoCTduFZaJrAgQ4OtD/ZqrkG6
 jN5nbKGPRiDWEDang/6hoZ2Iy+BF+FfUSi5qEevLvSiDuRlDaKkHSI0mPn8fRp4M=
X-Gm-Gg: ASbGnctH/GSucNMiN++Pd++wVKLx3yiI7MNKXHsC6NjaqY5tDPpSCKB91GwRQTQmW1T
 b3MyLy1Ck6H89JpvHBMdd7RqawiZg/rYPllePenORfwWabh0A1k95xxYSeuFnTAAfKMDj86YiqJ
 Zuf/ibH71wsqCj4I2xm2lIx6KTDz98zHNEBwCBSvSbkXKxBLivSLiO21M03P+r9625bo1a20CMO
 ScaCOjPUek5dkUPzzsjYccVrDctuqz/35yeDD9/+zeM4dTX6Z5eDbsAoEz6w7UcTW5IZOTqdZMq
 6FZJYyukti6FEENM0zGneprLqYCdUJ+gIO61X3MJF7mQZxE3d0IB30J59/sromlBne9IqCPxhpv
 JXJekeu+qs2KezcedlXJpk082eI3hiUwo4OLrrtBvhn7KTJuzXJklLJLrEI2xSDCQnnwDNqbCR6
 Fh/q4=
X-Received: by 2002:a05:600d:6348:b0:477:1be1:9afe with SMTP id
 5b1f17b1804b1-4771be19d6emr7058635e9.9.1761651503325; 
 Tue, 28 Oct 2025 04:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv0jNmYx0Af9PZs2AJZV5+nVN6X2LPf/KrXe3m1I3ko4nYkjq0LPFaael3P2zvvhQRRJykIA==
X-Received: by 2002:a05:600d:6348:b0:477:1be1:9afe with SMTP id
 5b1f17b1804b1-4771be19d6emr7058525e9.9.1761651502939; 
 Tue, 28 Oct 2025 04:38:22 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.110.222])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771bc597c7sm7614935e9.1.2025.10.28.04.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 04:38:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Chen Miao <chenmiao@openatom.club>
Subject: [PATCH] rust: migration: allow passing ParentField<> to vmstate_of!
Date: Tue, 28 Oct 2025 12:38:21 +0100
Message-ID: <20251028113821.1736215-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -AztdXd9r_VuBtjGOjqTuYY_r8rQUnqCNFCscDao2s8_1761651504
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

The common superclass for devices could have its own migration state;
for it to be included in the subclass's VMState, ParentField<> must
implement the VMState trait.

Reported-by: Chen Miao <chenmiao@openatom.club>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 roms/opensbi                  | 2 +-
 rust/migration/src/vmstate.rs | 3 ++-
 rust/qom/src/qom.rs           | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/roms/opensbi b/roms/opensbi
index a32a9106911..43cace6c367 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit a32a91069119e7a5aa31e6bc51d5e00860be3d80
+Subproject commit 43cace6c3671e5172d0df0a8963e552bb04b7b20
diff --git a/rust/migration/src/vmstate.rs b/rust/migration/src/vmstate.rs
index 42e5df8d818..5a237c409ac 100644
--- a/rust/migration/src/vmstate.rs
+++ b/rust/migration/src/vmstate.rs
@@ -268,7 +268,7 @@ macro_rules! impl_vmstate_transparent {
     ($type:ty where $base:tt: VMState $($where:tt)*) => {
         unsafe impl<$base> $crate::vmstate::VMState for $type where $base: $crate::vmstate::VMState $($where)* {
             const BASE: $crate::vmstate::VMStateField = $crate::vmstate::VMStateField {
-                size: mem::size_of::<$type>(),
+                size: ::core::mem::size_of::<$type>(),
                 ..<$base as $crate::vmstate::VMState>::BASE
             };
             const VARRAY_FLAG: $crate::bindings::VMStateFlags = <$base as $crate::vmstate::VMState>::VARRAY_FLAG;
@@ -282,6 +282,7 @@ unsafe impl<$base> $crate::vmstate::VMState for $type where $base: $crate::vmsta
 impl_vmstate_transparent!(std::cell::UnsafeCell<T> where T: VMState);
 impl_vmstate_transparent!(std::pin::Pin<T> where T: VMState);
 impl_vmstate_transparent!(common::Opaque<T> where T: VMState);
+impl_vmstate_transparent!(std::mem::ManuallyDrop<T> where T: VMState);
 
 #[macro_export]
 macro_rules! impl_vmstate_bitsized {
diff --git a/rust/qom/src/qom.rs b/rust/qom/src/qom.rs
index 5808051cd77..84455cea79b 100644
--- a/rust/qom/src/qom.rs
+++ b/rust/qom/src/qom.rs
@@ -102,7 +102,7 @@
 };
 
 use common::Opaque;
-use migration::impl_vmstate_pointer;
+use migration::{impl_vmstate_pointer, impl_vmstate_transparent};
 
 use crate::bindings::{
     self, object_class_dynamic_cast, object_dynamic_cast, object_get_class, object_get_typename,
@@ -182,6 +182,7 @@ fn as_ref(&self) -> &$parent {
 #[derive(Debug)]
 #[repr(transparent)]
 pub struct ParentField<T: ObjectType>(std::mem::ManuallyDrop<T>);
+impl_vmstate_transparent!(ParentField<T> where T: VMState + ObjectType);
 
 impl<T: ObjectType> Deref for ParentField<T> {
     type Target = T;
-- 
2.51.1



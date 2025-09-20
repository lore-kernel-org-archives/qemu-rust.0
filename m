Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DBACAC5A8
	for <qemu-rust@archiver.kernel.org>; Sat, 20 Sep 2025 14:31:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uzyba-0007Ng-W1; Sat, 20 Sep 2025 10:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybY-0007L9-3i
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybV-0005Tn-Na
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758378621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9jcGdX1lSvJdDQcVF4FUrlARni1t0sPnSGCmO+JHDo=;
 b=RQuhzQeOQPiRpXmVBCYe8opcsgalVNxHCDHUuosGJCKDnkkul8oAhH/bWKJNRw9ieaLPeo
 9Ras6IYseBPHK8OQaQMozwO625kvthk+lTyH78N2PaX+9ennMbtUwiNFDY2lXmFYlrxlaK
 PpP5iUQbkDsLBlco93SrR6S+qHI72bA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Zpr7Dx-HNJK47gNwcuiGVw-1; Sat, 20 Sep 2025 10:30:19 -0400
X-MC-Unique: Zpr7Dx-HNJK47gNwcuiGVw-1
X-Mimecast-MFC-AGG-ID: Zpr7Dx-HNJK47gNwcuiGVw_1758378618
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3ef9218daf5so940802f8f.1
 for <qemu-rust@nongnu.org>; Sat, 20 Sep 2025 07:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758378618; x=1758983418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9jcGdX1lSvJdDQcVF4FUrlARni1t0sPnSGCmO+JHDo=;
 b=NYLk3XRLfASM14Y+qsAzhS3j4OZAvUn9avSRuzNVMWh37CDm7Ye6ajOaUwBqvrYjzP
 UGDXIM1rwwCZxgR7wJGZBScKqA1yIbOeiJ3zlEPOrjuZhLVF8j3jqrAYBnGYnDOHxrO6
 MmKcUcMVcM51DzqUaaoQBlYdwHJM/e0TWKLEtz+U2R+Vth/hcN9CKVc3uT1mHzRDmW/I
 0e6b4kIG2yGrstzu40KSocVwGc1Iar97/LOhbp3tjULwu+BLBXtlWsKuasRTNSEOj2+K
 Ymnj3y8aeu30BYlOquS+HA/PivijkP6/1Dd9wPqciNfY8u3nCzTEKVcrO13BZ769zY77
 g2OA==
X-Gm-Message-State: AOJu0YzAb50GjOmCtKinH/yVAILje6V8o7ybYf5HYqVaUCUg9nSYWcac
 /cJ2Nk1mkD5qQ7pW9mbmW6oTs+5EkyzPz2UU6Gum0QY3ZM7uBXObQHAsrz+MtXvMNJJMk8O3paE
 4OMmIF0zvH+Wf0od2KiKWAmlqUWXLYSmktWtY+695msXU6j9NMXP+kK0=
X-Gm-Gg: ASbGncv4gjGaNedFsLdKvFKo8AwNaspNnoMnDa4vvK1XX5iI5KCTIaTJnQ9OaxDRI+B
 6K5MN1LdTXDDjhyI4x8IariPC9Sx0HeWaE0zGm12bSqp1ry9uLKDH9AlFO59nH5RaCdR60xPazO
 NHp9nRvPBMKG6IovV2L13TWuSCy10JVRX6sSpAE02vEYAQ9Fp83jC8WYXRxCqihSQt3Bt9n14Fl
 +EF/H8Hjdds4i8gRw6HEIxKy9VtllygLH7XQjdRrZt5qn3EvvVN16Eo6HxLvRwzVdUjGLlP3BRK
 3fBig5FsC9BdtTtnc1OUk2igN4ERE0XM74q1UAGEirCCtbZToKAVa2FJI1u5lgGtEyq18ZZ/x8d
 CC8JUeOcfucO9l2An1+KFIBtojeYvyZ2Xie+jliJ9Vy4=
X-Received: by 2002:a05:6000:24c9:b0:3ec:ce37:3a6d with SMTP id
 ffacd0b85a97d-3ee857699acmr5746397f8f.47.1758378618418; 
 Sat, 20 Sep 2025 07:30:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVsQCkxTEWRDRQztw0Hn3LuLOS8XxwHM2e/j9Mx0kRIkEmI+325YL5RSZSPJLHN5BW03f3fg==
X-Received: by 2002:a05:6000:24c9:b0:3ec:ce37:3a6d with SMTP id
 ffacd0b85a97d-3ee857699acmr5746385f8f.47.1758378617995; 
 Sat, 20 Sep 2025 07:30:17 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.47.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07407fa3sm12145305f8f.21.2025.09.20.07.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 07:30:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, zhao1.liu@intel.com, manos.pitsidianakis@linaro.org
Subject: [PATCH 7/7] rust: migration: implement ToMigrationState as part of
 impl_vmstate_bitsized
Date: Sat, 20 Sep 2025 16:29:58 +0200
Message-ID: <20250920142958.181910-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920142958.181910-1-pbonzini@redhat.com>
References: <20250920142958.181910-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -wLb6zq7fWFOayhr3b2_7K6Fi4YdB5IjAp_lSYts_Fw_1758378618
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

This is most likely desirable, and is the easiest way to migrate
a bit-sized value without peeking at the innards of the bilge crate.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/migration/src/vmstate.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/migration/src/vmstate.rs b/rust/migration/src/vmstate.rs
index 421a236194d..882dab746fc 100644
--- a/rust/migration/src/vmstate.rs
+++ b/rust/migration/src/vmstate.rs
@@ -295,6 +295,25 @@ unsafe impl $crate::vmstate::VMState for $type {
                                           as ::bilge::prelude::Number>::UnderlyingType
                                          as $crate::vmstate::VMState>::VARRAY_FLAG;
         }
+
+        impl $crate::migratable::ToMigrationState for $type {
+            type Migrated = <<$type as ::bilge::prelude::Bitsized>::ArbitraryInt
+                                          as ::bilge::prelude::Number>::UnderlyingType;
+
+            fn snapshot_migration_state(&self, target: &mut Self::Migrated) -> Result<(), $crate::InvalidError> {
+                *target = Self::Migrated::from(*self);
+                Ok(())
+            }
+
+            fn restore_migrated_state_mut(
+                &mut self,
+                source: Self::Migrated,
+                version_id: u8,
+            ) -> Result<(), $crate::InvalidError> {
+                *self = Self::from(source);
+                Ok(())
+            }
+        }
     };
 }
 
-- 
2.51.0



Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C98DCAC5A5
	for <qemu-rust@archiver.kernel.org>; Sat, 20 Sep 2025 14:31:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uzybe-0007S1-7E; Sat, 20 Sep 2025 10:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybV-0007KN-Ib
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybT-0005TL-AC
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758378618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pbC1Ps+dAzTsqIP6WX+wZIGyK3TQi+fmkaYLXqHka4=;
 b=U9aayqreYiIqxeIl/x6cVMOGBjkfNBQu6sjBqZcs8ZHiDbU01ZDQguWRiOOxz3vLrG46hU
 0AfGK+lOrO4NvFHavL8gAPb2Ykagd5H0AfkTlTg4jnNgNaA8um2Nf94p8VJtgjUODUYz1I
 pfKQIQKGNCMx/ZwF3TVq7Xvjiej6nxI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-7pVABkZMNky0M4U891bsmQ-1; Sat, 20 Sep 2025 10:30:17 -0400
X-MC-Unique: 7pVABkZMNky0M4U891bsmQ-1
X-Mimecast-MFC-AGG-ID: 7pVABkZMNky0M4U891bsmQ_1758378616
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3f3c118cbb3so396039f8f.3
 for <qemu-rust@nongnu.org>; Sat, 20 Sep 2025 07:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758378616; x=1758983416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9pbC1Ps+dAzTsqIP6WX+wZIGyK3TQi+fmkaYLXqHka4=;
 b=ud8rXFYahV9sL05RslMWx4tgf1/AtjT0T4MkVi6fSNV1+vRtPWMlq3OnWk/ofkHWq2
 FbyjQ+HXw11+Ooxz+rEj6UfokhziOiHcDf2xpe+KUzxlxr9/HpyZBSnuf2YztfTX8qX0
 xj9AtIWk/l6cYcf2qJ8vjjUwKUCLstZmIY33A3z23aaVTVui4fQypCaAAJ4ttHfISgbm
 b3sOGTRY1f2Wf+ssxf7U0zo+DfdcrMDYzxogyxxrp6sTfdAp7NUzLLalLkEhQL21Hegm
 v1LoYQBBlfL+nsDbcPInR9CQhpMXUilGb8IS1/Tlo0sei8p0ARIMVk3esO1O/jioZmjk
 HASw==
X-Gm-Message-State: AOJu0YypFPVNMM9IcoFxtJR5lcP3rjiYU5TcnipRUPzGbKT960hoV/ai
 G26ArXY0oROrL1jX73OCJvT1R3HC9fWsc2BiLsNsFu4chI8E3RE8r0uC2fYoJmMnitzaXXqW5Av
 d0S5xDbFKm4vI0dcmbdlHcr6AT0J40bIaDAOC+GCVePpPqIF8aIh9j8M=
X-Gm-Gg: ASbGncuGLTa+5ZRr6+dGO0wS9dwMAJSvjVeaBf/4qBW/3B6K18UCNtk0KKjQKAkkRqJ
 z3EON27BxustmsVvtBAK//UdkwyBZYunqvRVLPyZQIil8MgPosa9KX4/PdtJ/N785dLmMRjdRFP
 Vwpykp7MZHDBVQ0PN63HI5uH0u31CFvVNVdwJ9Ado8NKjqhDBJjlsnu/oE3kUUEhSZ+ZVUuN8VP
 uT1tkiJBuHVlzL04CFbhv2wyFrzH+eazOSBICOFJgWqtsLbKatthSIB5dYN0zLYyH76UAmGNWl4
 T1gaz13XCf6yhYvlL87fr0sACZhCsvgewQTWs9mcT0ngcNWVbbnMXTvrzkQ5I7pOEMhhVpX6fUY
 NdguNPCfn9AKKxnKRE/V2Ndtn3WquN2hG2LXMkrwrekw=
X-Received: by 2002:a05:600c:4ed1:b0:45d:dbf4:8880 with SMTP id
 5b1f17b1804b1-467eb048bbcmr52826225e9.27.1758378615765; 
 Sat, 20 Sep 2025 07:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtpQlVrIBjGRymU78+iTO0yanR7FsyLJIrN/bi/H48KCbH18Ao8LVGUxN9TCaPjw6s6r9nVw==
X-Received: by 2002:a05:600c:4ed1:b0:45d:dbf4:8880 with SMTP id
 5b1f17b1804b1-467eb048bbcmr52826105e9.27.1758378615388; 
 Sat, 20 Sep 2025 07:30:15 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.47.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf3bfcsm12532849f8f.58.2025.09.20.07.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 07:30:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, zhao1.liu@intel.com, manos.pitsidianakis@linaro.org
Subject: [PATCH 6/7] rust: migration: implement ToMigrationState for Timer
Date: Sat, 20 Sep 2025 16:29:57 +0200
Message-ID: <20250920142958.181910-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920142958.181910-1-pbonzini@redhat.com>
References: <20250920142958.181910-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N6pTUvZEGqII-7y_yQXUZkKWz9ryNT4EwIAZJybMNUc_1758378616
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

Timer is a complex struct, allow adding it to a struct that
uses #[derive(ToMigrationState)]; similar to vmstate_timer, only
the expiration time has to be preserved.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/migration/src/migratable.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/migration/src/migratable.rs b/rust/migration/src/migratable.rs
index fa25317eea8..c4ad4f73d5c 100644
--- a/rust/migration/src/migratable.rs
+++ b/rust/migration/src/migratable.rs
@@ -202,6 +202,37 @@ fn restore_migrated_state(
     ) -> Result<(), InvalidError>;
 }
 
+impl ToMigrationState for util::timer::Timer {
+    type Migrated = i64;
+
+    fn snapshot_migration_state(&self, target: &mut i64) -> Result<(), InvalidError> {
+        // SAFETY: as_ptr() is unsafe to ensure that the caller reasons about
+        // the pinning of the data inside the Opaque<>.  Here all we do is
+        // access a field.
+        *target = unsafe { &*self.as_ptr() }.expire_time;
+        Ok(())
+    }
+
+    fn restore_migrated_state_mut(
+        &mut self,
+        source: Self::Migrated,
+        version_id: u8,
+    ) -> Result<(), InvalidError> {
+        self.restore_migrated_state(source, version_id)
+    }
+}
+
+impl ToMigrationStateShared for util::timer::Timer {
+    fn restore_migrated_state(&self, source: i64, _version_id: u8) -> Result<(), InvalidError> {
+        if source >= 0 {
+            self.modify(source as u64);
+        } else {
+            self.delete();
+        }
+        Ok(())
+    }
+}
+
 impl<T: ToMigrationStateShared, const N: usize> ToMigrationStateShared for [T; N]
 where
     [T::Migrated; N]: Default,
-- 
2.51.0



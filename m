Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYm3-0003WZ-EJ
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlh-00032M-Q1
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYld-0007sn-8N
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pxg/98qXOCGxIS0+0C2ldwJ8rlIMJBaj9BLbfUFLby0=;
 b=LU4JovJopwDkGSLGBt3DzVS555/6GOoVjGPP/q74LVybXOmILYBxc2qTgJG9xiHfUpRqaE
 jS72Mt7DNTGVzjQVFsAv6W75Jf/79CUbUDds9g0xCeexXveH0nxxokUTsyl8dA3cEBxm5h
 +PZvZ1XN3c58X8WKXd2eDUvARFYvg9g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-2Vp8cAiyPfyCOdcKRu8wJg-1; Mon, 26 May 2025 10:25:23 -0400
X-MC-Unique: 2Vp8cAiyPfyCOdcKRu8wJg-1
X-Mimecast-MFC-AGG-ID: 2Vp8cAiyPfyCOdcKRu8wJg_1748269522
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-44b1f5b91c1so17455775e9.1
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269522; x=1748874322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pxg/98qXOCGxIS0+0C2ldwJ8rlIMJBaj9BLbfUFLby0=;
 b=tRVdefuOfRph0vtbkdAMkjyuCcGsbQ4s3bQqdzxlrI584waEhQuedIytoy18cxiwjz
 vD0kPcw0BbB6JINs6FMCOAAmCfVzNMWIKHJ/xbnokv4XyENU6bYE43/Zw/dq9ZnV/6yD
 k88PJ9YlxUc4mbirKEYaH3RTaJcdD9Zb2jYEbvNPQnsd6pSGq3vx7JQ9e2mRWppZ/E8w
 P/8stGOSREWAzwaduT4ltEW4hLKkctNqlkJ5RinRrIjcuHwbSntYxPJrxziKs4gme98y
 723QuRNZ9yUxkgQVwmQrwBezQ9WS1L3eoXQvxlRYrB+S3fO8upZ0Ef+7vgAubO9KOBvh
 POIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbhx5RTvERi3MqOkJWgzffzcLnYqGNJpEGfmQOPdgOpLfLC+UeYy5KWjocOlRfiblk+ZUYagmCU6c=@nongnu.org
X-Gm-Message-State: AOJu0YwADOqRXXIqkkk0SJ05xe2rNV8AZshKgleqUBtw7AWSgbmH0wAL
 D1IuNnKpvk5Y6sbhQFoI9YqdcE2Yn9xk+DmRs6Q/GlzjJoa0sBatLUNCZoC4W+sI/1wJ4zejw/y
 Rq/cKLOQWsao3kknXVq0hCC41s0GVJBGEOhEjkhUwzAAPmcDwduel5PM=
X-Gm-Gg: ASbGncuHPyby/W/+nBnZRy5eIo9Jx1ziufNIU2ltbFi/zO3PGZVra+4R3A6LPY/mC6n
 VHOu5nfKDi74T1bIHeL/3p1eg1NDvxYmWeJbYoopi94u7FXzA1ZPkPDLdrwLwo7Y91FafpNaP7i
 9Rc7LMvnZbXAu16Sk4cpcsnlCiqvIjoR2w1xh4Z2AIx3kHueBlvFOaOOgmFKE3+y3flQ+Lhc0KU
 kyRUiMyPuun1cjymos7EWOYk69d2cBB+AJzYsdcv6P19r6Fv+/6sPcjk3RUcc7cQ9LtCKLvGfik
 tr20YJrsJ09TPg==
X-Received: by 2002:a05:600c:1d96:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-44c916071a2mr91336785e9.4.1748269522450; 
 Mon, 26 May 2025 07:25:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvUK5+9C/DNRU1XFsc4kPWYhQfHijzyszKQNaKq7ieOf3QPlYdJXcmWbEEwWdBGsy8k7wHqA==
X-Received: by 2002:a05:600c:1d96:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-44c916071a2mr91336465e9.4.1748269522016; 
 Mon, 26 May 2025 07:25:22 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23c07bfsm240131505e9.23.2025.05.26.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 11/12] rust/hpet: return errors from realize if properties are
 incorrect
Date: Mon, 26 May 2025 16:24:54 +0200
Message-ID: <20250526142455.1061519-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GvsQK1MSBIhXqItJXTJMWFXJKRK8yDGPx_-00Ij30TE_1748269522
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 26 May 2025 14:25:36 -0000

Match the code in hpet.c; this also allows removing the
BqlCell from the num_timers field.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/fw_cfg.rs |  7 +++----
 rust/hw/timer/hpet/src/hpet.rs   | 16 +++++++---------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/rust/hw/timer/hpet/src/fw_cfg.rs b/rust/hw/timer/hpet/src/fw_cfg.rs
index aa08d283519..140692062cd 100644
--- a/rust/hw/timer/hpet/src/fw_cfg.rs
+++ b/rust/hw/timer/hpet/src/fw_cfg.rs
@@ -36,7 +36,7 @@ unsafe impl Zeroable for HPETFwConfig {}
 };
 
 impl HPETFwConfig {
-    pub(crate) fn assign_hpet_id() -> usize {
+    pub(crate) fn assign_hpet_id() -> Result<usize, &'static str> {
         assert!(bql_locked());
         // SAFETY: all accesses go through these methods, which guarantee
         // that the accesses are protected by the BQL.
@@ -48,13 +48,12 @@ pub(crate) fn assign_hpet_id() -> usize {
         }
 
         if fw_cfg.count == 8 {
-            // TODO: Add error binding: error_setg()
-            panic!("Only 8 instances of HPET is allowed");
+            Err("Only 8 instances of HPET are allowed")?;
         }
 
         let id: usize = fw_cfg.count.into();
         fw_cfg.count += 1;
-        id
+        Ok(id)
     }
 
     pub(crate) fn update_hpet_cfg(hpet_id: usize, timer_block_id: u32, address: u64) {
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index b2922e6a843..b298938e4d5 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -725,18 +725,16 @@ fn post_init(&self) {
     }
 
     fn realize(&self) -> qemu_api::Result<()> {
+        if self.num_timers.get() < HPET_MIN_TIMERS || self.num_timers.get() > HPET_MAX_TIMERS {
+            Err(format!(
+                "hpet.num_timers must be between {HPET_MIN_TIMERS} and {HPET_MAX_TIMERS}"
+            ))?;
+        }
         if self.int_route_cap == 0 {
-            // TODO: Add error binding: warn_report()
-            println!("Hpet's hpet-intcap property not initialized");
+            Err("hpet.hpet-intcap property not initialized")?;
         }
 
-        self.hpet_id.set(HPETFwConfig::assign_hpet_id());
-
-        if self.num_timers.get() < HPET_MIN_TIMERS {
-            self.num_timers.set(HPET_MIN_TIMERS);
-        } else if self.num_timers.get() > HPET_MAX_TIMERS {
-            self.num_timers.set(HPET_MAX_TIMERS);
-        }
+        self.hpet_id.set(HPETFwConfig::assign_hpet_id()?);
 
         self.init_timer();
         // 64-bit General Capabilities and ID Register; LegacyReplacementRoute.
-- 
2.49.0



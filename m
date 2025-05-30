Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKuiY-0002er-Da
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiR-0002a1-M1
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiO-0004eY-4p
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GD5j4iIBSM/wWOplLwp2FFPFSX88IRGEIBS2r4z9frY=;
 b=LHvuo/FmDzVl0qqhxHTpVHcUWdE0SzARL76gZEc0mmohFO0d3+P3TyOmuEtz8wvr39ZkFj
 8Vjelz6r+tRa6lymwOPBAWC7hD8IJZd1H2qzFBRHEAXLt7rvCSFbct4VQaS7PyTBRH/SVr
 bUkel8uwYTKUaUw35uhiP51OSAFdc7w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-tNje1h_EN2Wd7QUeOjA18w-1; Fri, 30 May 2025 04:03:42 -0400
X-MC-Unique: tNje1h_EN2Wd7QUeOjA18w-1
X-Mimecast-MFC-AGG-ID: tNje1h_EN2Wd7QUeOjA18w_1748592221
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-603f71f6432so1515641a12.3
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592220; x=1749197020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GD5j4iIBSM/wWOplLwp2FFPFSX88IRGEIBS2r4z9frY=;
 b=bAoCkg+3KPYwQeyp48rtm1o63TjSodbhU48Ui3RW4+gv0cC2+WurFC7XN0uYEBXHZ+
 UgvoAJBoJ3i68s6h+n5BtL237k9kBr3LR4p0BvLWFJHXP5l/mk7c053QXaxhJdcqegN+
 5rxdpZ/zIjEE0/GHEBcnXTeJJl8PpziQ2ONVaeuSzZtYamUbT8ehu9ZGWahiHeWkH49q
 C4p4bfLnz4EFPdzPnciDRzffY0AxOSrcXDUypMVVU2RuGTB2WOiKyNw93yzUsMM5KhLP
 5KfMpJpj3SZCJ5yCav0Llz7AOox3klvPmjhBcPw49s8IQlSnodaqEPiFCnmOXpBVjxqs
 dh/Q==
X-Gm-Message-State: AOJu0YyB7XuLGQgqyGBfCOK4gmvszQ/UretlHoON95p/OyoYBLWDk8+1
 UCuMbtCgTk9zbbanLk/1FX2YWmDSujP3XrWxyU4tbEiI/A8oLIaRrnuIwb5hZq+oxv+qLbXF0h5
 Oh6ol7aaiWegG3A9R55sSkSqOVrBqOnmLInjl7nuBJrBdHJwF+UQX0e93cggLhE8=
X-Gm-Gg: ASbGnctky/IMb0TZXaHC8dhh2Bv6TsNFKUTi4QlTYt3h2d3hSw3zm30g+DjyTP8q4H7
 W06ZpHKW4BuexOL+t1XliMomjJBdP1H6UHwqqyacGsR9wrONxXsynt7PrRMZ8LGenfIXqaebtUm
 a2LJ9dvC2q+icIqYi4c1Q3XMp209QJ1fP4SGQ8CEPAe/hbAsWc+7Cvlja1QBfBYJ98045DVF3GG
 loWKPfIsFULjvWU4F7XQvb50O0ivuafjKrfL+AA0UPVdY/UPRi/sNKDE0y269Hl1WTwUhcWdAHy
 lpdZCDKtWPAM7g==
X-Received: by 2002:a05:6402:278c:b0:5f8:e6e5:54ac with SMTP id
 4fb4d7f45d1cf-6057c1c36bfmr1160759a12.14.1748592220136; 
 Fri, 30 May 2025 01:03:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNCdp6lDkMlujaocP8dWaACw5BnDqPn3Yld2gp69Q6EA29uYQsVMCayMPNnhnXpAWYk8OwEw==
X-Received: by 2002:a05:6402:278c:b0:5f8:e6e5:54ac with SMTP id
 4fb4d7f45d1cf-6057c1c36bfmr1160724a12.14.1748592219683; 
 Fri, 30 May 2025 01:03:39 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2a757sm1247003a12.11.2025.05.30.01.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 12/14] rust/hpet: return errors from realize if properties are
 incorrect
Date: Fri, 30 May 2025 10:03:04 +0200
Message-ID: <20250530080307.2055502-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com>
References: <20250530080307.2055502-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S9JkVSWn45QyF83QhZEu-wi809SfmbHS7Nr4SIiKw20_1748592221
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.902,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 30 May 2025 08:03:49 -0000

Match the code in hpet.c; this also allows removing the
BqlCell from the num_timers field.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs | 16 +++++++---------
 rust/hw/timer/hpet/src/fw_cfg.rs |  7 +++----
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index a957de1e767..cd439f90b7e 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
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
diff --git a/rust/hw/timer/hpet/src/fw_cfg.rs b/rust/hw/timer/hpet/src/fw_cfg.rs
index 6c10316104c..619d662ee1e 100644
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
-- 
2.49.0



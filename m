Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C012ACAC5B5
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:52:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9g-0001UA-65; Mon, 29 Sep 2025 11:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G96-00010f-9t
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8s-0000c7-EG
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759161018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FZwR772WilyPlQiqTOSUvFpm4aGMNEEmbioRqmBBig=;
 b=RKzm0eE2kImTA2dgFDgViewY0RTiqpz1ZvCILtewMwlZpqrQTPNLIpP3PoayoV63IX1cva
 NGKlzwWkdz1/rnAJGHg54v4UXc7AZuOCoLPHV6l2UdhQy0NB1LDDNRUNSYMmq0Ji4mSh3B
 Ss48Ne5+UhrwHyYgkKsjltKYcQws0lk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-gmrFbvSTOzi14eSBuKG_OQ-1; Mon, 29 Sep 2025 11:50:16 -0400
X-MC-Unique: gmrFbvSTOzi14eSBuKG_OQ-1
X-Mimecast-MFC-AGG-ID: gmrFbvSTOzi14eSBuKG_OQ_1759161015
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b3fd9c9df9eso125210266b.0
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759161015; x=1759765815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FZwR772WilyPlQiqTOSUvFpm4aGMNEEmbioRqmBBig=;
 b=XQ6uCK1OT4Y2bsuHu0jZtYjnyfXRDqEdvb0jvPTkz7cE09ysabSSIBenEBVBYJG4ET
 fUTquQovQjFZrMbyqzqkct6btiis4T794TUBUzi9VH9MSbQe1laZOndE0ZZgy6w3y9ZC
 MhXB0FDmbWQTd2x3z1hlAO2PxOe2T2d5Rd4YbONuaGARgoCCja2dekbpKRAwuYpoO40N
 M7rOTSmx36CF096Kl/QYH9Jot40s5xbtj3WyrV/Eg2Kk9qcKWfuTje3LFv8RwirbKEJf
 Gxhp2kTFbqYXkard0gg7otGUuHuqVk7hhACRA+WWDx8t+OVYMrdXmm9PGnLoU7y52ZbX
 aeYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuAtBcVZJjBpoi2Gx1j/aWb6dvXDSqG5P7C1cvKckiSreElS6w8Bj889Ps2+iCe6XFqJVHpyUrq0o=@nongnu.org
X-Gm-Message-State: AOJu0YwxCAxwnxqgK37ROC596AIMH7j7hOBHCLrDYo1VP8UzatL1tCpA
 yUX72YCBwOCualkffNTkrBO5yvFyGzJnjXLqq1QQo2pGB5QF0+SfwtJiT/Z7EsxFc9ScfDQGqy9
 WYMBcNDs9DBxOhi+L2mjc/RjhW022W6Y0564bcgC39jVSWHX3V9RCeRQ=
X-Gm-Gg: ASbGncvOXO041C6rEBbuLQWcJ7CHsHxF3/cy9FgWKZ7KCPAZyUonVFP/rD/uTN9qRhP
 Qx3yotgGsfXJaxhpw99nM1NTs9hB8Gcci7+lpi/WjN2eJao2Hq5+XEkrk1IQUHDb77/zIIDm1U6
 pPlL/wWsSI5MNYPV/ldpVlBFoq/ZZGKExTCizwOlN+rk+RJ4leansZbPSvpfZonKTnPALcgoUgb
 ENmx9eHQZ0SJha2nUAMhsg/GxvAKwK4X3JAH+/rT3tOrLgg9HuLufAL2VhIghDanUV2OTiRz85y
 Z4anNvT1QqB16/faZzAAbXS7x7VjxKVgojmlU0cJLHBykM751Kmf3ysp8Jjnr7JF2u+x5m6ewk2
 JlXb6HN7N9rX4FxyKwOt53NW4icXQJhQXSI/sNicQvPH65w==
X-Received: by 2002:a17:907:c25:b0:b3f:5a00:161d with SMTP id
 a640c23a62f3a-b413562219emr116126666b.1.1759161015034; 
 Mon, 29 Sep 2025 08:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2Yvz6WdNce+2qmtF9I5Jdxk3mEcihUcc0DS+9V5GDIEPvrmsRxsIEiF5wXKY9ZVr9ZfOcdg==
X-Received: by 2002:a17:907:c25:b0:b3f:5a00:161d with SMTP id
 a640c23a62f3a-b413562219emr116124066b.1.1759161014597; 
 Mon, 29 Sep 2025 08:50:14 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3b74cb1e9asm454771566b.98.2025.09.29.08.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:50:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/16] log: change qemu_loglevel to unsigned
Date: Mon, 29 Sep 2025 17:49:35 +0200
Message-ID: <20250929154938.594389-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0ThlNx6XIAcRyN7_91hBSmYMWD1EYHyiB_ubSLarQoc_1759161015
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
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

Bindgen makes the LOG_* constants unsigned, even if they are defined as
(1 << 15):

   pub const LOG_TRACE: u32 = 32768;

Make them unsigned in C as well through the BIT() macro, and also change
the type of the variable that they are used with.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/log-for-trace.h |  4 ++--
 include/qemu/log.h           | 44 ++++++++++++++++++------------------
 util/log.c                   |  2 +-
 rust/util/src/log.rs         |  2 +-
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/include/qemu/log-for-trace.h b/include/qemu/log-for-trace.h
index d47c9cd4462..f3a8791f1d4 100644
--- a/include/qemu/log-for-trace.h
+++ b/include/qemu/log-for-trace.h
@@ -19,9 +19,9 @@
 #define QEMU_LOG_FOR_TRACE_H
 
 /* Private global variable, don't use */
-extern int qemu_loglevel;
+extern unsigned qemu_loglevel;
 
-#define LOG_TRACE          (1 << 15)
+#define LOG_TRACE          (1u << 15)
 
 /* Returns true if a bit is set in the current loglevel mask */
 static inline bool qemu_loglevel_mask(int mask)
diff --git a/include/qemu/log.h b/include/qemu/log.h
index aae72985f0d..7effba4da4c 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -14,30 +14,30 @@ bool qemu_log_enabled(void);
 /* Returns true if qemu_log() will write somewhere other than stderr. */
 bool qemu_log_separate(void);
 
-#define CPU_LOG_TB_OUT_ASM (1 << 0)
-#define CPU_LOG_TB_IN_ASM  (1 << 1)
-#define CPU_LOG_TB_OP      (1 << 2)
-#define CPU_LOG_TB_OP_OPT  (1 << 3)
-#define CPU_LOG_INT        (1 << 4)
-#define CPU_LOG_EXEC       (1 << 5)
-#define CPU_LOG_PCALL      (1 << 6)
-#define CPU_LOG_TB_CPU     (1 << 8)
-#define CPU_LOG_RESET      (1 << 9)
-#define LOG_UNIMP          (1 << 10)
-#define LOG_GUEST_ERROR    (1 << 11)
-#define CPU_LOG_MMU        (1 << 12)
-#define CPU_LOG_TB_NOCHAIN (1 << 13)
-#define CPU_LOG_PAGE       (1 << 14)
+#define CPU_LOG_TB_OUT_ASM (1u << 0)
+#define CPU_LOG_TB_IN_ASM  (1u << 1)
+#define CPU_LOG_TB_OP      (1u << 2)
+#define CPU_LOG_TB_OP_OPT  (1u << 3)
+#define CPU_LOG_INT        (1u << 4)
+#define CPU_LOG_EXEC       (1u << 5)
+#define CPU_LOG_PCALL      (1u << 6)
+#define CPU_LOG_TB_CPU     (1u << 8)
+#define CPU_LOG_RESET      (1u << 9)
+#define LOG_UNIMP          (1u << 10)
+#define LOG_GUEST_ERROR    (1u << 11)
+#define CPU_LOG_MMU        (1u << 12)
+#define CPU_LOG_TB_NOCHAIN (1u << 13)
+#define CPU_LOG_PAGE       (1u << 14)
 /* LOG_TRACE (1 << 15) is defined in log-for-trace.h */
-#define CPU_LOG_TB_OP_IND  (1 << 16)
-#define CPU_LOG_TB_FPU     (1 << 17)
-#define CPU_LOG_PLUGIN     (1 << 18)
+#define CPU_LOG_TB_OP_IND  (1u << 16)
+#define CPU_LOG_TB_FPU     (1u << 17)
+#define CPU_LOG_PLUGIN     (1u << 18)
 /* LOG_STRACE is used for user-mode strace logging. */
-#define LOG_STRACE         (1 << 19)
-#define LOG_PER_THREAD     (1 << 20)
-#define CPU_LOG_TB_VPU     (1 << 21)
-#define LOG_TB_OP_PLUGIN   (1 << 22)
-#define LOG_INVALID_MEM    (1 << 23)
+#define LOG_STRACE         (1u << 19)
+#define LOG_PER_THREAD     (1u << 20)
+#define CPU_LOG_TB_VPU     (1u << 21)
+#define LOG_TB_OP_PLUGIN   (1u << 22)
+#define LOG_INVALID_MEM    (1u << 23)
 
 /* Lock/unlock output. */
 
diff --git a/util/log.c b/util/log.c
index abdcb6b3111..41f78ce86b2 100644
--- a/util/log.c
+++ b/util/log.c
@@ -44,7 +44,7 @@ static FILE *global_file;
 static __thread FILE *thread_file;
 static __thread Notifier qemu_log_thread_cleanup_notifier;
 
-int qemu_loglevel;
+unsigned qemu_loglevel;
 static bool log_per_thread;
 static GArray *debug_regions;
 
diff --git a/rust/util/src/log.rs b/rust/util/src/log.rs
index af9a3e91234..0a4bc4249a1 100644
--- a/rust/util/src/log.rs
+++ b/rust/util/src/log.rs
@@ -142,7 +142,7 @@ macro_rules! log_mask_ln {
         let _: $crate::log::Log = $mask;
 
         if unsafe {
-            ($crate::bindings::qemu_loglevel & ($mask as std::os::raw::c_int)) != 0
+            ($crate::bindings::qemu_loglevel & ($mask as std::os::raw::c_uint)) != 0
         } {
             _ = $crate::log::LogGuard::log_fmt(
                 format_args!("{}\n", format_args!($fmt $($args)*)));
-- 
2.51.0



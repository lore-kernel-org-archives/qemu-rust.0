Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2E0C55177
	for <qemu-rust@archiver.kernel.org>; Sun,  2 Aug 2026 17:18:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wqZps-0000HS-9a; Sun, 02 Aug 2026 13:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phind.uet@gmail.com>)
 id 1wqZbf-0006TG-QQ
 for qemu-rust@nongnu.org; Sun, 02 Aug 2026 13:04:11 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phind.uet@gmail.com>)
 id 1wqZbe-0003R5-EZ
 for qemu-rust@nongnu.org; Sun, 02 Aug 2026 13:04:11 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-cbe431467e6so724750a12.1
 for <qemu-rust@nongnu.org>; Sun, 02 Aug 2026 10:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785690249; x=1786295049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eTuO9kwkWQSNmODPQFPuOrz0Ciy9WrXZe0TuYOqtle0=;
 b=r8K66EWJ7vCo/Z6UDg1zE3mMbdL4JuYYB2lCBM5Tr3wNAZiKRfG2URdPjNBsvJ76wC
 1di8K1VHQFcZ9SdaCGZ1AdTfybLMB2vm26M5zotM+W89eX6sLaYEBtt/xdNlCh8uy/0W
 F6N3pCSfLnwFMN4U2ketPVAK3oKfCn30yhLejibJGEajQuD/DgDoiPQPetsFP1EFuqdQ
 HytCdkmwv7wdbO7ukMisUXiFMlQU6/7dUhlxAlnhhF0tOFr8bDeKumP9/Vd5MtkY9Gtw
 JrpdrpStNnHFAeXg/gjz2/HDykzYvDsc/QmJPn5JiVYchbHSMx7l/SJZiDZ5y7PuRv+d
 JObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785690249; x=1786295049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eTuO9kwkWQSNmODPQFPuOrz0Ciy9WrXZe0TuYOqtle0=;
 b=bL5eNaOPKd+pylUZI7xW6mjC9E+QxOXkHkJbCOfPYgV0zkdjK+5c8lkXZWKsgUIC0p
 EVzJlhLNIEkCBLEb2SGd9XyJhUr2xMqJKR5yy2YmIfYCB3d6ahuEWVcwlgKv4HMkDtRe
 UX2P/nJVVjdht6Tzr4Eb0DPEp4ZcbfK/fU5JXMY8Z+lbhAcYgSRPKrbHTiFEHJCNcxon
 AakJvim6uSVnxD9vZuxp6R+SSD76KpxWsyvqNtnxDhIFLm2vOZyns/QvAEZ6APZ9bJoQ
 bpZPOmNMGy/NYi/K07OtVhQUp+BCYedPKGWa6Z6cmPo1GwCKx2G9JhYS2y6ipGsjtGQD
 XRLA==
X-Gm-Message-State: AOJu0YyAg7OOLjaOCQy2iYaV1uS4VpX+0rDIpYdShUcY58/KLbKfOyF6
 jzGCTR39YG0TJP7kNoZROLipznw4H8Ge3Qs3seWIHUdmxqIsH7L9lE8c
X-Gm-Gg: AR+sD12/AvuRG1dDGLAzlW94lG/GlzmD3DrCkMulvM6ev0sjo1H5DpTG2HxxRVBoh0e
 n9HWnx2Pzp9xCNJxiEqO7aW/Isi5euDi3qscU7rtZWMa2+TPfXIi2AV5jQxQzy8NQNBcgJW/6Fv
 +ta1rKMQv5dpSNGA1xHsrL205jvEYdWHB6uJHzBPrTwQekYwJrRI/hB/pPPGTNYZHrX2rMOR8h2
 MNwdaQM9/gp5XUh9oRpYbTYBHZsZBcVAq+cCaO7rMV2cZ7ZMaqLwVuvrxS7OVZN3aAnYTH3ctNz
 fQhxbC0Rdk4wXp7z7kG4JCCxfqQ5G45HnkVGOh7L12mwkh4f8iDwH4+g+2VAlpI5goataBR5GRg
 5GXDT+9hqYWNRf5DP4NnofjpI5w1zKisJpr+XzcveL9nhJyWU4NeErrVLfDe7Wk+1N4SucXDc/r
 h+Ml8NPWrz8ZPtWf2fAideKxXoAtQ0tqDMKK9w49biRMTFeuIJX7Ip8ll3vuWCaA==
X-Received: by 2002:a05:6a20:2451:b0:3c3:80bc:1540 with SMTP id
 adf61e73a8af0-3c91a711b5cmr8040174637.3.1785690248820; 
 Sun, 02 Aug 2026 10:04:08 -0700 (PDT)
Received: from phi.nguyendp ([116.86.160.247])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13fab132cc4sm22982126c88.2.2026.08.02.10.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 10:04:08 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Nguyen Dinh Phi <phind.uet@gmail.com>
Subject: [PATCH 1/2] rust/bits: Align SubAssign behavior with Sub
Date: Mon,  3 Aug 2026 01:03:44 +0800
Message-ID: <20260802170346.3493821-2-phind.uet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802170346.3493821-1-phind.uet@gmail.com>
References: <20260802170346.3493821-1-phind.uet@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=phind.uet@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 Aug 2026 13:18:50 -0400
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

Update SubAssign to perform a bit-clear operation instead of arithmetic
subtraction, matching the behavior of Sub.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 rust/bits/src/lib.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/bits/src/lib.rs b/rust/bits/src/lib.rs
index d1141f7c88..60b63f969d 100644
--- a/rust/bits/src/lib.rs
+++ b/rust/bits/src/lib.rs
@@ -320,7 +320,7 @@ fn sub(self, rhs: $struct_name) -> Self::Output {
 
         impl ::std::ops::SubAssign<$struct_name> for $struct_name {
             fn sub_assign(&mut self, rhs: $struct_name) {
-                self.0 = self.0 - rhs.0
+                self.0 &= !rhs.0
             }
         }
 
@@ -443,4 +443,11 @@ pub fn test_xor() {
             InterruptMask::OE | InterruptMask::PE | InterruptMask::FE
         );
     }
+
+    #[test]
+    pub fn test_sub_assign() {
+        let mut op1 = InterruptMask::E;
+        op1 -= InterruptMask::RI;
+        assert_eq!(op1, InterruptMask::E - InterruptMask::RI);
+    }
 }
-- 
2.53.0



Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC828EF3718
	for <qemu-rust@archiver.kernel.org>; Mon,  9 Mar 2026 17:24:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vzeLb-0008Lr-0x; Mon, 09 Mar 2026 13:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzeLV-0008Im-Sa
 for qemu-rust@nongnu.org; Mon, 09 Mar 2026 13:24:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzeLU-00076q-Cd
 for qemu-rust@nongnu.org; Mon, 09 Mar 2026 13:24:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439a89b6fd0so8625762f8f.2
 for <qemu-rust@nongnu.org>; Mon, 09 Mar 2026 10:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773077082; x=1773681882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=djpSU6U0CqC98s8Vdl2mJmar37Sy3poebBGy1LFVZVU=;
 b=lpPV/BR6czfl17B3RWp8Bi0reFpoMhMtLS4R2EGdv/bWUT4YKV9zRAXehqpFKAuSnV
 cicWHOfnW9NftMoZvwI9lCdrJZLD++yhja5BqDQVEIAZmiBFRbRtu1sJQzQ5tKRErAi8
 8GgjRaw2oOJrBB/kM310E5q5n9oppMaSUmiACE8Y2uNnVGV9F3iT+CjVl5WaJUh9B8gx
 JXah0IYr4/4W5jEBdnAgUdtzisuwvsVGfGS5AkKHDpdecYKjBsC7z8f5vgFv8qCLgjV6
 LZGAc4gm9M0zIOKNdcqP2A1WfNUjB1WxkY27xVd2yHPz/QpcL5uaCRZhzpoq3NncRQzX
 +7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773077082; x=1773681882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djpSU6U0CqC98s8Vdl2mJmar37Sy3poebBGy1LFVZVU=;
 b=R/s42KXEtDCPQ+b7lyHm49QRvwjEu9WrmTbGuQ2bABBXxxv8zfhUuMP/gwPpzhGQly
 bjLvycLXU57ExqmNQxFaZQgAmEp+Xkn6IeT9tuHS4rYJS0CvApLXKbzbUFG05/pGMBAs
 EeBkYK1kF0YjE59mvI9KqygZe/0prl8EbrOheRaM0PYkAeMA5LfFQwqdbY6p/cBUUg5S
 hgvpaYSTCUZEuZRGnCOjy49GnEGCYTXf8ZHKc1yyTPAJ1egiD4yrIg6NMf4tTLmG7Av5
 6unH8QVkqXaWb/NK4Z3/Xr4qgM9WaVw0k8+76MedSIGqsO3diE1rtRXgOxOw5oa4M2WM
 gguQ==
X-Gm-Message-State: AOJu0YypgEbyqOMCUI0WRj10yJzVFXatSLMEMUTcMJ+FnOpzzadc83Kl
 fTlRz2Hb26lrjslugxwueoAuNS4aD455XSuewNA6nyfQsXhhExQq2aDRv3yVB9NJwxo=
X-Gm-Gg: ATEYQzwctuaKbXsgLjDIyE75iMjuhjpGGgt6pgCsvG6T2oMKYnunRj+1kTgqXIhG/oR
 Gpu/whZYaHoJN99jYPslsXBKDiq0sjcHq5SJMOMDLRPosjYDrI9rtsvPGgTyATDcJyCn5jZh/A/
 zF5VrSVzqI06Ur4npvpU/urho9iI2AlulCVcflkme89YP4MCuBWjAek1Mk46kv2qmKkcZMfjuIr
 OM1Zr8JZF4NcvM8ST6JvlB0wem13tCMHRCShJCFujW+TCU2x0yAbq3b9VHxFQKOFJy/GdmC0j3D
 DAc9t2SJyO8XjMGGChQX/5rdGXkwXYufkIvTKpQxjrEQdzXlZxKlHVbsCOua87x8Ax6L62aD3Xa
 SVTGeIkiHkmpUnsnZlhFtqIMhdL7vwD1TWfIFdY/vP7u6VgvHIll0o0OcT2lEbx23U/PJy/tNJq
 +n6J9AXGDFDybnvLHsydFpLoEvrf5mPz5eeEnrpWcc/1QccAcG1BwVsvf6J/uZcsjPBQOpzJNg
X-Received: by 2002:a05:6000:310c:b0:439:b28c:d47c with SMTP id
 ffacd0b85a97d-439da8820eamr21854677f8f.37.1773077082371; 
 Mon, 09 Mar 2026 10:24:42 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad97abasm25731670f8f.10.2026.03.09.10.24.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Mar 2026 10:24:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] rust: Update Cargo.lock
Date: Mon,  9 Mar 2026 18:24:40 +0100
Message-ID: <20260309172440.66409-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Update Cargo.lock on top of commit  7ecd3f71079 ("Merge tag
'for-upstream' of https://gitlab.com/bonzini/qemu into staging").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 rust/Cargo.lock | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index 801ac5f4f51..cbb3ca15f77 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -172,7 +172,6 @@ dependencies = [
  "migration",
  "qemu_macros",
  "qom",
- "system",
  "util",
 ]
 
@@ -351,7 +350,6 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "0dca6411025b24b60bfa7ec1fe1f8e710ac09782dca409ee8237ba74b51295fd"
 dependencies = [
  "serde_core",
- "serde_derive",
 ]
 
 [[package]]
@@ -407,6 +405,7 @@ dependencies = [
  "bql",
  "common",
  "glib-sys",
+ "hwcore",
  "migration",
  "qom",
  "system-sys",
-- 
2.53.0



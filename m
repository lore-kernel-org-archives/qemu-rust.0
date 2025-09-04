Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B96CA1015
	for <qemu-rust@archiver.kernel.org>; Thu,  4 Sep 2025 08:16:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uu58l-0003N7-Th; Thu, 04 Sep 2025 04:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu559-0006bv-3L
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:37 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54b-0004DI-8B
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:34 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so103936166b.3
 for <qemu-rust@nongnu.org>; Thu, 04 Sep 2025 01:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973519; x=1757578319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRlsHGqvmjF2Vf3U8TOAt/9n2Jks0amzBlUrbfofXWc=;
 b=QI+cZspRjrpy3CvOuDYgZuKvrx1UpTP+Ydr27eM91ovS2np+ZU/ijhXONbGIEMTeSp
 lBlpzoFqOuNuKyE3tiW4MM3V5S1N9MiIezdHF72Z2zb91Crgx5exCu18+FAATovq3SH5
 J5MCTT+HEf2cMv1Z94WW3esJDS2ySdL0ZdIo6r/JCHljCHxiNLqAWBBcOGGtadpVLahT
 DPzJQQhjLZ2hNY/AIl3mIW6/Dvc4shzM/26/Ey1WTxjDxsqMheQjL2ctz3Qe4RRA4RAS
 hpWLhMsFQUhZms35B9DeBL3pnFIqRDFw13TadUYOdZpv0VfD7wCjRcHs069t8eYapzEw
 614Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973519; x=1757578319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRlsHGqvmjF2Vf3U8TOAt/9n2Jks0amzBlUrbfofXWc=;
 b=G0jONxnh8uEo8sHa+PkVF2EFo5OeG9myNxp7okoBtEaiAeAZlfzRqT4UJS4utH8eLU
 NCrplVvSy4E03RlSmNpNQITHKCD++3HTYQZxq2gFzAcXm3rPJdTNy5YXHHAhBfWVQEoJ
 rGbhxG+6OU7Fir7ttY69no39zo1gjlaDljtiqv3+TDb7V39MykqZuONu+Ia77F5wv99j
 PYFS9k4G251NXXCg+NZ5geLw2RUwwXQWuRcU2R919rKRF5pPQt4qJlz/epWvqkOSwuaS
 fkZ9pHc14IrqDhJ1/TiHgRnCkNM4EHECE1X68BgnGtqmtZQH252aQqt2/0/LNeb69iSG
 k3zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyOfY8UfMxh0w6ciKnYY2Mlco6SABAmD7okvbRvChbN+PKMqFi7aiGqNA753naXig/N8wHtvLwkuE=@nongnu.org
X-Gm-Message-State: AOJu0Yz7eJmg7lQkgtS4sL+cExuYazNLQgKcAzKoAXtF1F7xvENa2ObY
 HzRgdLTIY+6iEuCqCM3T9Xq/fDf0oAAW0eBsbLKBhiGiAQ1wXdkC/hXUnZbLQuiXghk=
X-Gm-Gg: ASbGnctoTaKdS/mS5MIwWQPRAr6o/oJdssn+5KUh6SN6/c2zGNKSHhJbRdOTIZT5aUk
 ye69iLpm+T9v232oRwKlPa3xQtwY0VFV03f8h6ePeaak5G2lG2FJsqzQ3dh8hAK4sTZdTLAkDEh
 Y8Vba8RVp1+NBu3uslt5aj2d2iaiUJTQAt1RSmf7p7gniWmbgjq5N+D0MX18TxEFlKy9ihZ/vlI
 /RrO3J2z931CzL6tsUxL69o9o9gs6QGRvsdrHD2mqeoF0J1Lh+2bDB01tx9n4AVowt7JXSqcN0G
 CMjTn6GpNmFfqmDSxFi4n1iw/+pmsKBq1JpDIBoD/Zo5tpLfYurx9qvlQIWkd+8LgfRiFaMvfcb
 KG5GUuH3pvWCNdAvixPrFK2A=
X-Google-Smtp-Source: AGHT+IHiB61XSQJ8aB9kXr4pJ7kTktTaOCm5+fM0Vksx2NmfVFmOxv3vcmFjV8pk0rEQY7r1+KjTyw==
X-Received: by 2002:a17:907:3cca:b0:b04:354e:47a5 with SMTP id
 a640c23a62f3a-b04354e4b78mr1354661066b.17.1756973519415; 
 Thu, 04 Sep 2025 01:11:59 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0432937d7esm869790666b.17.2025.09.04.01.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9C0DE60363;
 Thu, 04 Sep 2025 09:11:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>
Subject: [PATCH v2 057/281] linux-user: Move get_elf_hwcap to
 loongarch64/elfload.c
Date: Thu,  4 Sep 2025 09:07:31 +0100
Message-ID: <20250904081128.1942269-58-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Change the return type to abi_ulong, and pass in the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/loader.h                 |  3 +-
 linux-user/loongarch64/target_elf.h |  2 ++
 linux-user/elfload.c                | 49 +----------------------------
 linux-user/loongarch64/elfload.c    | 47 +++++++++++++++++++++++++++
 4 files changed, 52 insertions(+), 49 deletions(-)

diff --git a/linux-user/loader.h b/linux-user/loader.h
index 818c5e6d7d7..92b6d41145e 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -102,7 +102,8 @@ extern unsigned long guest_stack_size;
 const char *get_elf_cpu_model(uint32_t eflags);
 
 #if defined(TARGET_I386) || defined(TARGET_X86_64) || defined(TARGET_ARM) \
-    || defined(TARGET_SPARC) || defined(TARGET_PPC)
+    || defined(TARGET_SPARC) || defined(TARGET_PPC) \
+    || defined(TARGET_LOONGARCH64)
 abi_ulong get_elf_hwcap(CPUState *cs);
 abi_ulong get_elf_hwcap2(CPUState *cs);
 #endif
diff --git a/linux-user/loongarch64/target_elf.h b/linux-user/loongarch64/target_elf.h
index 39a08d35d9b..037740d36f2 100644
--- a/linux-user/loongarch64/target_elf.h
+++ b/linux-user/loongarch64/target_elf.h
@@ -6,4 +6,6 @@
 #ifndef LOONGARCH_TARGET_ELF_H
 #define LOONGARCH_TARGET_ELF_H
 
+#define HAVE_ELF_HWCAP          1
+
 #endif
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 843b1f7b6cc..574b37a22c1 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -725,54 +725,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE        4096
 
-#define ELF_HWCAP get_elf_hwcap()
-
-/* See arch/loongarch/include/uapi/asm/hwcap.h */
-enum {
-    HWCAP_LOONGARCH_CPUCFG   = (1 << 0),
-    HWCAP_LOONGARCH_LAM      = (1 << 1),
-    HWCAP_LOONGARCH_UAL      = (1 << 2),
-    HWCAP_LOONGARCH_FPU      = (1 << 3),
-    HWCAP_LOONGARCH_LSX      = (1 << 4),
-    HWCAP_LOONGARCH_LASX     = (1 << 5),
-    HWCAP_LOONGARCH_CRC32    = (1 << 6),
-    HWCAP_LOONGARCH_COMPLEX  = (1 << 7),
-    HWCAP_LOONGARCH_CRYPTO   = (1 << 8),
-    HWCAP_LOONGARCH_LVZ      = (1 << 9),
-    HWCAP_LOONGARCH_LBT_X86  = (1 << 10),
-    HWCAP_LOONGARCH_LBT_ARM  = (1 << 11),
-    HWCAP_LOONGARCH_LBT_MIPS = (1 << 12),
-};
-
-static uint32_t get_elf_hwcap(void)
-{
-    LoongArchCPU *cpu = LOONGARCH_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
-
-    hwcaps |= HWCAP_LOONGARCH_CRC32;
-
-    if (FIELD_EX32(cpu->env.cpucfg[1], CPUCFG1, UAL)) {
-        hwcaps |= HWCAP_LOONGARCH_UAL;
-    }
-
-    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, FP)) {
-        hwcaps |= HWCAP_LOONGARCH_FPU;
-    }
-
-    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, LAM)) {
-        hwcaps |= HWCAP_LOONGARCH_LAM;
-    }
-
-    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, LSX)) {
-        hwcaps |= HWCAP_LOONGARCH_LSX;
-    }
-
-    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, LASX)) {
-        hwcaps |= HWCAP_LOONGARCH_LASX;
-    }
-
-    return hwcaps;
-}
+#define ELF_HWCAP get_elf_hwcap(thread_cpu)
 
 #define ELF_PLATFORM "loongarch"
 
diff --git a/linux-user/loongarch64/elfload.c b/linux-user/loongarch64/elfload.c
index 874dc4c2304..ee4a85b8d6c 100644
--- a/linux-user/loongarch64/elfload.c
+++ b/linux-user/loongarch64/elfload.c
@@ -9,3 +9,50 @@ const char *get_elf_cpu_model(uint32_t eflags)
 {
     return "la464";
 }
+
+/* See arch/loongarch/include/uapi/asm/hwcap.h */
+enum {
+    HWCAP_LOONGARCH_CPUCFG   = (1 << 0),
+    HWCAP_LOONGARCH_LAM      = (1 << 1),
+    HWCAP_LOONGARCH_UAL      = (1 << 2),
+    HWCAP_LOONGARCH_FPU      = (1 << 3),
+    HWCAP_LOONGARCH_LSX      = (1 << 4),
+    HWCAP_LOONGARCH_LASX     = (1 << 5),
+    HWCAP_LOONGARCH_CRC32    = (1 << 6),
+    HWCAP_LOONGARCH_COMPLEX  = (1 << 7),
+    HWCAP_LOONGARCH_CRYPTO   = (1 << 8),
+    HWCAP_LOONGARCH_LVZ      = (1 << 9),
+    HWCAP_LOONGARCH_LBT_X86  = (1 << 10),
+    HWCAP_LOONGARCH_LBT_ARM  = (1 << 11),
+    HWCAP_LOONGARCH_LBT_MIPS = (1 << 12),
+};
+
+abi_ulong get_elf_hwcap(CPUState *cs)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    abi_ulong hwcaps = 0;
+
+    hwcaps |= HWCAP_LOONGARCH_CRC32;
+
+    if (FIELD_EX32(cpu->env.cpucfg[1], CPUCFG1, UAL)) {
+        hwcaps |= HWCAP_LOONGARCH_UAL;
+    }
+
+    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, FP)) {
+        hwcaps |= HWCAP_LOONGARCH_FPU;
+    }
+
+    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, LAM)) {
+        hwcaps |= HWCAP_LOONGARCH_LAM;
+    }
+
+    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, LSX)) {
+        hwcaps |= HWCAP_LOONGARCH_LSX;
+    }
+
+    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, LASX)) {
+        hwcaps |= HWCAP_LOONGARCH_LASX;
+    }
+
+    return hwcaps;
+}
-- 
2.47.2



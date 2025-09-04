Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF26CA1012
	for <qemu-rust@archiver.kernel.org>; Thu,  4 Sep 2025 08:25:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uu5AX-0008Bn-V0; Thu, 04 Sep 2025 04:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55P-0006n9-8z
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:57 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54o-0004IT-Jg
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:50 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b00a9989633so132910066b.0
 for <qemu-rust@nongnu.org>; Thu, 04 Sep 2025 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973529; x=1757578329; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLl9oYpNkKlC5u6Dy+xpIH1LWB2sTjU8xRvbErhSckk=;
 b=JfQGnLN7wlpBU3Nh26joYZOJ0Mz8cEWd5b0NVhOr7Rcq3xKhk2gDZpQCJS46CNVpxD
 i4XdCv+3mqdnKcNvpa9RWfkphNwI24oLSQr+v61moDMZx+f3421iycK3LQpE9vCT04ew
 V6pqtyjyE+5qwOMIRfMj5UI7tnO7J4FSCB4NYENQmavRzdMltznTWlrGqjgv5fp9I5B5
 wlQV7C5EozBFK8O7hacQh8QDlcRzidhv6Q4WisNfNR+tlwtVXPDz3jAmrXYzsLomTz3O
 Mq+i3D6n8TF+drQiuvTP8JPq4UrVTBEGEHWybikFnKmWQFWDXKLIoC2dTmC8kgA5PYsZ
 1y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973529; x=1757578329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLl9oYpNkKlC5u6Dy+xpIH1LWB2sTjU8xRvbErhSckk=;
 b=Cr7PoQTJvh1LBgRdTP3Chc9pf35AVxOOTDVRh2tkPrbE/ZkCNSO7qyzgLXdCU9TEqi
 CcJ+vHTr0L3zdunBw181oJGmtzhwi7ScxMj0nLtMNBj8uq0uZGUExsoiB3ihBAOtWBzb
 Z6//uyt7fnDxqfB4nNtfAJ2H0rCThvzpaf1oABsiP1vAnJlPp4JYnZ/sZhun3UsI9edn
 noVxt8jMPuQPuDfoMKvYCWTt08HwBRY5jiK+KlIIx8/UQULjsJ/okmB3cNuGldJg34cR
 eCoPjTZPTq9Umx0wj61Lo6EGkJ9gJ0yg/S7jRs81H58+/ZUdTSJFPtIIy90QlhwMcVWZ
 yuiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB0KFUEUxRlwg7svUVLAnuzZPWpZnpYLeGJiSPujk1ggTiB0aj9uiQEWaA2FDUSrP8vbe7zXRKAyE=@nongnu.org
X-Gm-Message-State: AOJu0YzgPWU4USCQSyau5WyOtv90grr44XDi0r3NVxMbMEmu1OYrvWZm
 a5DX1Pr07Ac088g1OvtQTe9en5MU1oaEF1jfSQRpPUxRNgXkQXAwy32JEraDZqGneew=
X-Gm-Gg: ASbGncuLX6HmdD0wATu10XtArWnNNJPdppw/2I43YbClNiwjz3rmAtkH541MH1xKPo7
 kK7OemxfPlcO3zzlXCzRp94bQZ2MO72JaH86qPFP3YpXlkFoML7TZoi/oS56J/o3A3OGrxf7hTx
 eTPKiwO6j45ZGFY9aVf44WJldIGIB+einEdWhvO3W5+FY/Nclet5mNpEXiOXD7BGc0whGFp2XNV
 qW+X+9QgiQ8EI7YSsAm3FQncRVvkjQkH1VRfpQfU3GZlPGPUkfzoI9sHQNYlbJ8YUuO59Hpqj3y
 Rn3GuOTdYOlVGXZS+qCoI/AW5Ds4+UW6270ioOE74YUE45dMCxjdYsX5JUfziNUop/xBo2n97K3
 b5orRLx0gpJI0eGu6TBXvt+T5yhrLPqufCHQjI5o0bEJB
X-Google-Smtp-Source: AGHT+IHg43VIz5IWaoCglFsXYUVyXtk+RFiP5eDwfdW8F/G9pRndbxerLOqZv98JEUjySgovhYynfw==
X-Received: by 2002:a17:907:3fa2:b0:b04:3623:aa10 with SMTP id
 a640c23a62f3a-b043623b1c6mr1473568066b.2.1756973529066; 
 Thu, 04 Sep 2025 01:12:09 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b018fe7c638sm1311287266b.6.2025.09.04.01.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:12:04 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7EACA60AD9;
 Thu, 04 Sep 2025 09:11:38 +0100 (BST)
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
Subject: [PATCH v2 080/281] linux-user/mips: Create init_main_thread
Date: Thu,  4 Sep 2025 09:07:54 +0100
Message-ID: <20250904081128.1942269-81-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

Merge init_thread and target_cpu_copy_regs.
There's no point going through a target_pt_regs intermediate.

Note that init_thread had set cp0_status in target_pt_regs, but
target_cpu_copy_regs did not copy to env.  This turns out to be
ok because mips_cpu_reset_hold initializes CP0_Status properly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c       |  8 +-------
 linux-user/mips/cpu_loop.c | 16 ++++++----------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0feccfbe916..ac96755b06c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -581,13 +581,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define elf_check_abi(x) (!((x) & EF_MIPS_ABI2))
 #endif
 
-static inline void init_thread(struct target_pt_regs *regs,
-                               struct image_info *infop)
-{
-    regs->cp0_status = 2 << CP0St_KSU;
-    regs->cp0_epc = infop->entry;
-    regs->regs[29] = infop->start_stack;
-}
+#define HAVE_INIT_MAIN_THREAD
 
 /* See linux kernel: arch/mips/include/asm/elf.h.  */
 #define ELF_NREG 45
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 6405806eb02..e67b8a2e463 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -211,12 +211,9 @@ done_syscall:
     }
 }
 
-void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
+void init_main_thread(CPUState *cs, struct image_info *info)
 {
-    CPUState *cpu = env_cpu(env);
-    TaskState *ts = get_task_state(cpu);
-    struct image_info *info = ts->info;
-    int i;
+    CPUArchState *env = cpu_env(cs);
 
     struct mode_req {
         bool single;
@@ -245,12 +242,11 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
 
     struct mode_req prog_req;
     struct mode_req interp_req;
+    target_ulong entry = info->entry;
 
-    for(i = 0; i < 32; i++) {
-        env->active_tc.gpr[i] = regs->regs[i];
-    }
-    env->active_tc.PC = regs->cp0_epc & ~(target_ulong)1;
-    if (regs->cp0_epc & 1) {
+    env->active_tc.gpr[29] = info->start_stack;
+    env->active_tc.PC = entry & ~(target_ulong)1;
+    if (entry & 1) {
         env->hflags |= MIPS_HFLAG_M16;
     }
 
-- 
2.47.2



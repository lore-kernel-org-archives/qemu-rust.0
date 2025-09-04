Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE21ECA1013
	for <qemu-rust@archiver.kernel.org>; Thu,  4 Sep 2025 08:26:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uu59t-0006Oq-J6; Thu, 04 Sep 2025 04:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu553-0006Yj-Uv
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:30 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54Y-0004BQ-Bh
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:29 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b03fa5c5a89so107102066b.2
 for <qemu-rust@nongnu.org>; Thu, 04 Sep 2025 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973516; x=1757578316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihVvxQgeNn/GjHbnY+gzjmvaE+8lZrZaLCxntP4XREM=;
 b=avRlE9VTTURAZOpb8FUB9d5rAta+5agkzNhCtstztO98O/IqGmh327Lerp0U/0Qyi6
 2J8wa16ayXLXhtD8YVrpoyzNpbX7QwZUFS08/cTWtqzCaPDkQD01Fk2+xE5ZLZvzccqK
 dsFEgfB1VFl+1e/hy6r4RdTP9GhuxupWH7W+h94fpF775L8vwTpvKG7UYVFm7CuT8H6r
 FG1PXa9Prw6Ak+o01RrHwzRjK84YGFEEM0epn0h+hmSke3J9GKKH51zuj5F0TelqVnFO
 wiFadNt5/sR6U2sNtncBpzLbGv1rS4egHd0vF5ehKMQjKSveIeFjsEVPvGO9WQyoT4JQ
 5lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973516; x=1757578316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihVvxQgeNn/GjHbnY+gzjmvaE+8lZrZaLCxntP4XREM=;
 b=MWzbdkUkETwWNdF/ts8NOB7xzJNNQiNVqUOF0PQ+u8Cc4bCgvLEEp48PqLKgp6GtnI
 SbgC2IX22tpAOhVTx7/zSiyoT7V4lOdZ8Hu9rfcmUmYZDuN85+4CF3rxXdd2DQ167MkI
 yVmB/1TqQrTlAbZyFB3FiYtn+6YH5d5BJ9VYfNTB7CjnOlFjZn4Mf043O7Wm/nWwDKTe
 finub+y/oDdvJXbNJfRIRTgRiBWODx5sfyZGDwzoMIbS8FvWOxlVbhdTWHbIuWI9VF63
 dsYWVAi3B+7NgN8+04Oj2YvQXznFvvZOjrzafHCXFfuj4v2Lvuq3VJuUiYb3Jo+3DRCk
 lQnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpxIN4MuHXyDEC3pZ6oz9hby/fM1gyZwlezzCQ9KD1VVR1FIdEqvtqvLvk2Pe1WTBUWQDbQKcp3rQ=@nongnu.org
X-Gm-Message-State: AOJu0YwM0+osrH0g2pfxXsNuVxAkJZLfUggphk7JI1TXWa9unFNt7MjX
 ZrE2oIhwXPM8QMo+mq1JJznQmxYpkDZlUnth9isDZL1rB2Cnpi6JtnUTDhfVSA4NpFA=
X-Gm-Gg: ASbGnctB5Dl/Rpi+BEt0jsAwelkye5yXdAw51UtLI+YTFrBjGaYvUY8l6BUhn3Cua5K
 BKLWmy2gyI26nkFusK1Zrxe1mbdMSJvIrMnpzpgLbr1BsKpD9uNpPTYAO84AcrsYsT7xhWP0CZs
 UuyQ5hrd0vssTdANfDGjWpCfPrvLjdKrq7YGMMS1xj/2dnYqmowjoh8ZKsO4VZVxx+Hae/hnAHX
 Tzn8uthfMccp6aUE/Ti2Pb24RpUB5Tp9Ps15WoKzrmzK/mE8OcNHRcU0iliTFVX5A6UT2wmtMUw
 54042gdYRK30h6uZM7xNSIQlyg6HLLvJPGNQ0YAjmB8fwLica7Bhq2rNwTp1TeWQj7nftE5vJTj
 S1zC2WzQ5bUtfO+G8tJU4gvA=
X-Google-Smtp-Source: AGHT+IE6icEl4XuEBWlH8j8BpgjiN6xgfsXzhcsYUMtNnFW6HtKULX+/oPffLgfaZHVhKWGCJwwp1Q==
X-Received: by 2002:a17:907:2682:b0:afd:d9e4:51e7 with SMTP id
 a640c23a62f3a-b01f20bde05mr360782366b.63.1756973516361; 
 Thu, 04 Sep 2025 01:11:56 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04709b3effsm279304666b.5.2025.09.04.01.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0EB89601A4;
 Thu, 04 Sep 2025 09:11:34 +0100 (BST)
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
Subject: [PATCH v2 048/281] semihosting: Retrieve stack top from image_info
Date: Thu,  4 Sep 2025 09:07:22 +0100
Message-ID: <20250904081128.1942269-49-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

Remove the write-once field TaskState.stack_base, and use the
same value from struct image_info.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h             | 1 -
 linux-user/aarch64/cpu_loop.c | 1 -
 linux-user/arm/cpu_loop.c     | 1 -
 linux-user/m68k/cpu_loop.c    | 1 -
 linux-user/riscv/cpu_loop.c   | 1 -
 semihosting/arm-compat-semi.c | 6 +++++-
 6 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 0b19fa43e65..b6621536b36 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -127,7 +127,6 @@ struct TaskState {
     abi_ulong heap_base;
     abi_ulong heap_limit;
 #endif
-    abi_ulong stack_base;
     int used; /* non zero if used */
     struct image_info *info;
     struct linux_binprm *bprm;
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index fea43cefa6b..b65999a75bf 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -168,7 +168,6 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
         qemu_guest_getrandom_nofail(&env->keys, sizeof(env->keys));
     }
 
-    ts->stack_base = info->start_stack;
     ts->heap_base = info->brk;
     /* This will be filled in on the first SYS_HEAPINFO call.  */
     ts->heap_limit = 0;
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 33f63951a95..e40d6beafa2 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -504,7 +504,6 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
     arm_rebuild_hflags(env);
 #endif
 
-    ts->stack_base = info->start_stack;
     ts->heap_base = info->brk;
     /* This will be filled in on the first SYS_HEAPINFO call.  */
     ts->heap_limit = 0;
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 5da91b997ae..3aaaf02ca4e 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -117,7 +117,6 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
     env->aregs[7] = regs->usp;
     env->sr = regs->sr;
 
-    ts->stack_base = info->start_stack;
     ts->heap_base = info->brk;
     /* This will be filled in on the first SYS_HEAPINFO call.  */
     ts->heap_limit = 0;
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 3ac8bbfec1f..541de765ffa 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -109,7 +109,6 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
         exit(EXIT_FAILURE);
     }
 
-    ts->stack_base = info->start_stack;
     ts->heap_base = info->brk;
     /* This will be filled in on the first SYS_HEAPINFO call.  */
     ts->heap_limit = 0;
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 86e5260e504..bc04b02eba8 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -696,7 +696,11 @@ void do_common_semihosting(CPUState *cs)
 
             retvals[0] = ts->heap_base;
             retvals[1] = ts->heap_limit;
-            retvals[2] = ts->stack_base;
+            /*
+             * Note that semihosting is *not* thread aware.
+             * Always return the stack base of the main thread.
+             */
+            retvals[2] = ts->info->start_stack;
             retvals[3] = 0; /* Stack limit.  */
 #else
             retvals[0] = info.heapbase;  /* Heap Base */
-- 
2.47.2



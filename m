Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF9FCA1012
	for <qemu-rust@archiver.kernel.org>; Thu,  4 Sep 2025 08:25:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uu5Ag-0000LB-G6; Thu, 04 Sep 2025 04:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55Y-0006wj-NE
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:13:04 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54w-0004Kp-GK
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:59 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so1149852a12.0
 for <qemu-rust@nongnu.org>; Thu, 04 Sep 2025 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973534; x=1757578334; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5Zye4y6NxJaSczxcVcmt24avvGWMTOUTr/+SGRum6M=;
 b=oZhNqbatmZbF5XPkK5klFuGhvaJvT6KVFz3fRH5XG27CwSAMYzsM9qP3Z66ez/2krB
 5CqKOiqSTDkzYL8UacVOA4M0qqv84l8ThZl82hpeftWyN8flWAMGoNPv+1PjHx13Hi2s
 ibd/bBmPAoWBHnyY5EoHa3mqel3RxePPgW/5d4UPDMopgAYqvY9+1BNM92n3AwXSoSg/
 /e/81SCMDBKmctQZKsiRKSfg3B7KIfSddVQn5+F2jXs+M4s+vsOHLjxxixd0NoEkx1GE
 j3IWQ1zF1RvTvW8vuXuO9TP1Frx2TBlXbpEm911qCY4hkqhue9i/eeZ0J42pAa7569Mi
 yOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973534; x=1757578334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5Zye4y6NxJaSczxcVcmt24avvGWMTOUTr/+SGRum6M=;
 b=JbFhOHKnRbaXJfUsj9WvhFFZjGMGBQVl8YCYOCzmhz81e7c4Jlm/RjtUD/Ms1+DUjM
 5xyiNVJq8oKyvbIk+ma+HNJUA8UNijFSlq9TbBFpKEpbJEPKrdQFU7o3RUogsKL8DJa3
 hAvDzIWjEQA7fPwjwhd8tX726xcP2ucpTtyAu0OkrC6M4ARRDNhH7N+BlRpKJxiuL+Hn
 /t/1od97XNFQLB3yoKs8S1nGNvRJQa2cRfNE7K9GF7OlL3cpUj3z8nWveAvv+y2XdsVk
 27spk4+hltzN5lVJn16ItWCDP2SAL1CiCSuf5hXKw7pMWW49cVnEHn/Uyy//gPNu5y8X
 7U1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj2lLlD6E60gsg5axLcrO2LPhtt/mZ2KPXMRF2/bSfHd+JPPxJIHFlHphiX4+Ypg93GyoO7eB8syc=@nongnu.org
X-Gm-Message-State: AOJu0YyIo6P0jmjMC8pzqCeyYUpuH1q5KsCWHd4fc06UHUSWT/V1ojMt
 8DNPkSQ5jO0BFpecAo53nOd/uGXAi//JzuKvDxCZhUxVxjsy1kKLzymMkmdj/0liVzo=
X-Gm-Gg: ASbGnctDx/sxYe98EY6DZcT8H4R1otAW+u2JV7k9QwmKEdWPxklSrK9kvjSDtrlsbA6
 H0+QawhmHfFrtd41NUhq6PNIPXNCW01WPsSJrfXVoDLUkZTt+PuSP4wp9XtNoG5HT9Hot4on3sB
 GmVvdgQX+oLiSUkc8HMWTCxNZwZe3DIm6NV0RMdMdTTk8szlw6CxgZBr0Al/AGlruOBTsYi3CZH
 tjWQRcR0JY63iAOL25Cz5Bu8M1oxRAP4WkQEGnxM+mHswpbMSVNl2ebl2xmPRn9idWqX7ul+VZI
 0zne4I7S/ebdmgrh0k9BLG9YY/8j1ZSb938FKpMbowFSkd3nEr+ClJxgTgW+ypHXUjuoJMa7Yt/
 DxKBI5iQyIX+r3lzU4BtXxAGj6I6cGNmfJw==
X-Google-Smtp-Source: AGHT+IGvhyi3Ob8FQTO0E+SlWXz70PknUDYB759PnOR+EDDgh33qtQBCOSrVgpXzaEOgq2NGLcCnnA==
X-Received: by 2002:a05:6402:2549:b0:618:afa:70b1 with SMTP id
 4fb4d7f45d1cf-61d26c32e70mr15695243a12.20.1756973533908; 
 Thu, 04 Sep 2025 01:12:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbc6bsm13985707a12.29.2025.09.04.01.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:12:10 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BA7BD5F93B;
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
Subject: [PATCH v2 082/281] linux-user/openrisc: Create init_main_thread
Date: Thu,  4 Sep 2025 09:07:56 +0100
Message-ID: <20250904081128.1942269-83-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c           |  7 +------
 linux-user/openrisc/cpu_loop.c | 11 ++++-------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3f9ec493595..03c95397744 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -673,12 +673,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMBState *env
 #define ELF_CLASS ELFCLASS32
 #define ELF_DATA  ELFDATA2MSB
 
-static inline void init_thread(struct target_pt_regs *regs,
-                               struct image_info *infop)
-{
-    regs->pc = infop->entry;
-    regs->gpr[1] = infop->start_stack;
-}
+#define HAVE_INIT_MAIN_THREAD
 
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE 8192
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 306b4f8eb43..8c72347a99a 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -83,13 +83,10 @@ void cpu_loop(CPUOpenRISCState *env)
     }
 }
 
-void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
+void init_main_thread(CPUState *cs, struct image_info *info)
 {
-    int i;
+    CPUArchState *env = cpu_env(cs);
 
-    for (i = 0; i < 32; i++) {
-        cpu_set_gpr(env, i, regs->gpr[i]);
-    }
-    env->pc = regs->pc;
-    cpu_set_sr(env, regs->sr);
+    env->pc = info->entry;
+    cpu_set_gpr(env, 1, info->start_stack);
 }
-- 
2.47.2



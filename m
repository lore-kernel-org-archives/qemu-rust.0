Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43315CA1015
	for <qemu-rust@archiver.kernel.org>; Thu,  4 Sep 2025 08:15:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uu57D-0000eY-Mu; Thu, 04 Sep 2025 04:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54k-0006P9-Pj
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:16 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54M-00043y-5r
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:12:09 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61e425434bbso1227346a12.2
 for <qemu-rust@nongnu.org>; Thu, 04 Sep 2025 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973504; x=1757578304; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=myCatgpniSey/NjO+dQuRIOhbIuhsJO0uetvy2+5HH0=;
 b=RUxR2UhYbVNB7RMY5XfgxDcFmBAI78Y24kCaKVwfdUCAqdRnbSNVHHJ31raF+IjUao
 WM2u8pTa+xGdyee6Q0SRyk8jaHv5BvkODZOs/Z18JkD4OSL0prIiSn/kvEXAxZJHh+C+
 +5AyX9x/8KEP1vVqMT15OVhpwwYOLYinUH+BQgezubS/ZaEMYKJGpE2/ThiyxP+LLP6f
 TBCc63DRH9/rhlSbex46dRaIZ3ZD88JcDjHTMYPhi5jvIdHdxhZwoFHQckYS0jKcrQoD
 a4H5hYKV8OO8FUgaRK5aHujBFQmXJ3A9Br/MSzwEhe8pQOkESDG9NJqDAPoKs109vnTB
 zxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973504; x=1757578304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=myCatgpniSey/NjO+dQuRIOhbIuhsJO0uetvy2+5HH0=;
 b=DXI8/FmYUWlPWlNvbpJANMb/7GoXv0gYYOdVSAa/R9Ud159yzuapvIcDd6acQ9kV/V
 j1/9j0v5VSp3Xsiq3TFzOOmwKEDKvxEE48xUhv2Mhlv1slIUfn0xetNCqPpJ3wDlFYiN
 cG3cDpRyqKNAfVlE8x5zBfCAStm1N34GI46XhuAasVHZ3WI7IcznqWX7XZe34mcxtXkD
 yRVk57VDzYxsxKx75gJbTp/B3OFBzMhYOZLi7zGJ4zIuWb9EPeOj0NjlTsiFvKjn33wE
 PCiOYtTMHMCKPvU/WgaMApTsEsHvhEDMgpGusv7dWubKdD92Tn+CqRUu1xiWGnj964Ou
 nW9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdS/WjL9tKidpFkewHz896LawcQSaTxxtb2ejlL6p9RXHQ9CmcwUPf0inaH5GjR61a4jp2xOV3v0s=@nongnu.org
X-Gm-Message-State: AOJu0YzOct9qPg75Zlv58g7NVp3pjYIoPRwR1ceb5i0rqetg2wQiI0HG
 AUjFoFRYSvwQ0LX7N1pN0zTVaY7qlumLydKY/QN4M9jie3tUbqGf6jFrDPt0IzuAEKQ=
X-Gm-Gg: ASbGncsyAxCcJtIa14HyiXsFCf+3oD8cBU0ramN0BGka3iHTB7e8BAqbPpWK0x6HlMY
 rghaOaD81qiYYWLGSVbmNDduiFmiHk/JU6UuzNWAygKtoQBL5vMZ9UyER85ILeBC8tbtcgwu1zB
 PRhKimzlxaBWm3Az9cibiessY88uUQcJAR3WPoAEIL1jYCewemNA4Df+8NmA5UZwNHpLzAPCmy7
 MLJV2xCsKdMTwbGlwXUmEB7KlbldVjyZOaV7AlSxsdl6w5CiLg8pGPt5yOii4ZrUTVNaAzi6PIl
 R5Uvoe0kBhjzpoWtOp0AffTRqEdAhghvc+O4kC98VrjgCsMTzDDdBFPFZEjtsa/V9BKasUkssol
 DziSLEY7nqGDKJ2JCS6O00Fk=
X-Google-Smtp-Source: AGHT+IEkvYRALNYOlXlCh0M9P7tOTgw2dIkqwHytdvjqGaEFKKMvexexT1+4HGfULBPkmc4HuBN2QQ==
X-Received: by 2002:a05:6402:40ce:b0:61d:cd5:8b6e with SMTP id
 4fb4d7f45d1cf-61d260cc220mr16736785a12.0.1756973504083; 
 Thu, 04 Sep 2025 01:11:44 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ede659366sm2877110a12.24.2025.09.04.01.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 16B025FA31;
 Thu, 04 Sep 2025 09:11:30 +0100 (BST)
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
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 016/281] tests/functional/meson.build: Allow tests to
 reside in subfolders
Date: Thu,  4 Sep 2025 09:06:50 +0100
Message-ID: <20250904081128.1942269-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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

From: Thomas Huth <thuth@redhat.com>

We are going to move target-specific tests to subfolders that are
named after the target (and generic tests will be put into a "generic"
folder), so prepare the meson.build file to allow such locations, too.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-5-thuth@redhat.com>
---
 tests/functional/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 356aad12dee..8c24ac1cc2d 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -423,7 +423,13 @@ foreach speed : ['quick', 'thorough']
 
     foreach test : target_tests
       testname = '@0@-@1@'.format(target_base, test)
-      testfile = 'test_' + test + '.py'
+      if fs.exists('test_' + test + '.py')
+        testfile = 'test_' + test + '.py'
+      elif fs.exists('generic' / 'test_' + test + '.py')
+        testfile = 'generic' / 'test_' + test + '.py'
+      else
+        testfile = target_base / 'test_' + test + '.py'
+      endif
       testpath = meson.current_source_dir() / testfile
       teststamp = testname + '.tstamp'
       test_precache_env = environment()
-- 
2.47.2



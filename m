Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52326CA1013
	for <qemu-rust@archiver.kernel.org>; Thu,  4 Sep 2025 08:14:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uu54c-0006Im-BN; Thu, 04 Sep 2025 04:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54Z-0006Dg-0E
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:11:59 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54J-00040t-6g
 for qemu-rust@nongnu.org; Thu, 04 Sep 2025 04:11:58 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afec5651966so143298566b.2
 for <qemu-rust@nongnu.org>; Thu, 04 Sep 2025 01:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973500; x=1757578300; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHrtANvKFxNzkcAR0b6AvL2FoL97RQya7kVY684YbqM=;
 b=SEQkebx0f+a2248VgstBtza4jORb0i7e7R7xUbUN1rdFAHXcFfebXhdT+9rTtAgh2L
 /ub5rvBndNE30JwVRtOxMnNuwDDRGDIb8AWnsQQBpX7sTkckbkTMkkZTSBf2FmbmH1C0
 pEZsJx1szvd9YA+Se9tq76IWZROoa0pQ0ygYpA5dJ6r0Ao3LHpTZBxxmsIlzMHtDenv0
 hKyoOR+dKQTGGPt8xqrGB/O3y6BfjBCO2mxMj/YBQdHOOVAr9gnVbPHMRY9SIyZME/LC
 ZWu6gi1otc0iSGjcLVNAnUWN7qvLlX152oiRT9ZBR9vJsanBTFwXX13dZEApi17lxUBq
 7kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973500; x=1757578300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHrtANvKFxNzkcAR0b6AvL2FoL97RQya7kVY684YbqM=;
 b=XFHl/I3l/iSzqBZTI6SpgOIgQGSn9xTgoDZYzQFSdWT+S10o8q0GkTx4NOlsjecNIX
 nm1Xlsdo/2DzH3m4HaHq40kSEMwWrMgVjuz/1pa6hVQmuVHYJs/PpLIO/LYbv5yd4MY4
 Nw3QCI1ILjMPZ0iPuFKOSJd+uc4ew+LKYgbmPxicmW13maYxG8Bb6PwPYHuwGJgEi0K6
 6AEJH0sg33faqx1It06SnIZ6GcdWd0EK4rKHO2Zi9wdZSU/PF/ob985mEwZp7ZR6wBIT
 duimQO7yTDelbjidgQ8DGEzZ9oPsTWmnNqgUIshCXJwn+T0MECnMxjqKeu+lzl19ids6
 az4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqTAx0TwMMl4vQjcA7T4c3TAYZt2hntr+GBe4bD/KRyCLnctkFdhZxJiM+3tuQg40tHv8/Px2YaCY=@nongnu.org
X-Gm-Message-State: AOJu0YyAluj2+Adtlv5Y/90qOSITMlx/irFQHC81bBDwL+oDbXbLQblQ
 MMTmrCIaPqCkIMOiPYn0930/9y4WxJsAMlrriVGUxw2UT/zNXyrW5mhyyQozRpN9LrE=
X-Gm-Gg: ASbGncugftlMu5SNvVfkYNXXIZNpGu1S/DToHH612tmEe+JFX3ZPHKhzIrckTUyKuJ4
 hA+z36Wqq2kh9qqDwX2DwrxvFKdhXr2bNrDIRWVDK3h7rTwpib4Fx9ZTUaanwBS0d3ihuFzNW5Z
 wNciv7RAeaxIPNOB5PhHtck1tb9vS1mv54avwOtv4lDJQTgb1t3zw1qElnbkyFnip/laHh81fvM
 nBl6QIAM7gDh0OE1+HMqrMrWpcVGNT9Ho8VYCu+ci8yDpmK+KjdABgQUP4vy1a0l1aWLpm6Du81
 BN+2bzLwf7S+yICBFw7TwIH2dmU7+CUqLcw5R3pprMmCOBXjRNIDALU14QgNdPsLR8NXR/9Nu4P
 8+N+Ja/D38VDvxr6/JwetBhk=
X-Google-Smtp-Source: AGHT+IHWlLajDsQ384nIBXustMLg5QOay+NZ7bnHzT4T4G8CTt2TPFaQ6+dQTw7Hxia/vwaMzjizQQ==
X-Received: by 2002:a17:906:12cf:b0:b04:11e5:9a8e with SMTP id
 a640c23a62f3a-b0411e59b44mr1462147366b.40.1756973499887; 
 Thu, 04 Sep 2025 01:11:39 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046d420e02sm306741066b.39.2025.09.04.01.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:37 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D1C1B5F93A;
 Thu, 04 Sep 2025 09:11:28 +0100 (BST)
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
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 006/281] Update version for the v10.1.0 release
Date: Thu,  4 Sep 2025 09:06:40 +0100
Message-ID: <20250904081128.1942269-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 VERSION | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/VERSION b/VERSION
index dadcbd47d3c..4149c39eec6 100644
--- a/VERSION
+++ b/VERSION
@@ -1 +1 @@
-10.0.94
+10.1.0
-- 
2.47.2



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcvt-0000ot-UB
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcvq-0000hi-Lk
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:03:07 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcvo-0002S8-DC
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:03:05 -0400
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3d4436ba324so12125235ab.2
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140583; x=1746745383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxbj7/6jpfy/qwZ4ED6zTk/j6/a5zMwR5eVDDNTE+Aw=;
 b=Lsp1AG9lDLZgHf6eAETrKJR0UGj/z18y6zKyRKj0S6rlJz/WA4zGXLeAOJswN0/Ml5
 eL5vv2sLoK365D7od33wWYGCfmMc0XqLOLU26/z5tf4zrjW8LZAHHFv4g5XGheTujwjT
 BDBRtzkXkJqG1Vq2BYo0J0TrlULxSj7re/2JLuafklDdf5gIEfa52PSxP7EcXGPK5YjT
 atYo9nAM7wwXmrZTWWgp3cvaOEs6t8FLQ23xx79IOnzRNcnsaRGcAEPPdj2Y9pAryZqj
 68VqAyXS72CDXURIapSpFj/ZKVTsawGhhS8K7qcSwoyft1YCbOWya4TiX7RFV8UISRBe
 L1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140583; x=1746745383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxbj7/6jpfy/qwZ4ED6zTk/j6/a5zMwR5eVDDNTE+Aw=;
 b=WJ4pnN0hFv7Z/Fxy34PhMwm8uD6Gi8XNU2kvXfmUyJ9T8n8/z7oMzqEbdhDvHdrTGb
 hv1Tb9HA4NT3hAws8pOd7B5LACcXDn3jt2WIVNR/8rpJlxntE0ZHZosSMpqoqTmDVWQB
 FBT1+QwU2lXHwHvDJDwoEJ+8k56LfrrH7I0U2+Q0apQgQC4BEC9+4s+yq6dbbEEd8/D1
 57S+lelnoAm8Zh9nwzR1UpA4lpX5Y0eNVzy4zNucN2MrvIemBmG+Rcpsp/4JLMOigsNM
 oaLcPaNxnhsmJmpfnuhG2CwOAE8gvqrlGNBC1uhVmu8drgUqr52a/sMSbMmRF96gDu6P
 DrEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCZ7RSBfE3p8fAgpofPRG0HuEG1/9vXA7XLhf/JAIMjSLRGHdFpTvwApYhIqEI/jlBLTxk4OoVnqI=@nongnu.org
X-Gm-Message-State: AOJu0YxgXiVEhXzE7pvqQyHvhbfV3vdgWhPGP+Pt6ElLRR/UR6YDQLxO
 HzWtYAlTJpsKicFmvodDp3slPIssa50TfV+Cfhy0U/5dH0Q2Mgu2H0c7+j6vF58=
X-Gm-Gg: ASbGncu19NKbaDrmZ4fx4tz1Nq+neY43qPZBUM906DFHqRtXlwEl5vBiFJyKSqXA3JG
 z8INCag/BzUv5lc6eiaBAKIkm+VyMIZjU09g+1Oerm7BZuo9pC9/C5anW1UScy+WfMWeb/dpByI
 HWQpXpBDEwKcm1hm8rt/aMvHUIQDxupf+4wwZG0m3pC60GFyU8RH1wYnBxZFz6LADfJNVfSBa2s
 JKArzCN0QVhAom8eV7kuzN2bQoQO3Nw/twuGTS0ACaPmMB/qZkjWuTKTNEuHrtynAQeGGCUYOue
 yPmoxYeZDJiOzShl31jj2oGsRH8jHapscsPBqBL7hrRQhTGxl9fy7kNhKVjW5Awjv+BVplU41aR
 bYiAniMVjW83jciNXoqXPjeEffWGxZbg=
X-Google-Smtp-Source: AGHT+IEXbuFFne0bt1KlOJySBL/5o8UWkx58G4hGCj6erG2/vT7c9L0SEJFjHFzcVa0/pob8KTwFnw==
X-Received: by 2002:a05:6e02:16ca:b0:3d6:d145:2ffb with SMTP id
 e9e14a558f8ab-3d97c2579fbmr10256185ab.21.1746140582938; 
 Thu, 01 May 2025 16:03:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975e7d0d3sm3507565ab.28.2025.05.01.16.02.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:03:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-rust@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 10/10] hw/display/vga-pci: Do not expose the 'global-vmstate'
 property
Date: Fri,  2 May 2025 01:01:28 +0200
Message-ID: <20250501230129.2596-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Thu, 01 May 2025 23:03:07 -0000

The "global-vmstate" property is 'false' by default, and was only
set to 'true' in the hw_compat_2_12[] array. We removed all machines
using that array. Stop exposing that property on the PCI devices.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/cirrus_vga.c | 2 --
 hw/display/qxl.c        | 1 -
 hw/display/vga-pci.c    | 1 -
 hw/display/vmware_vga.c | 2 --
 4 files changed, 6 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index ef08694626d..f9f704ab440 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2987,8 +2987,6 @@ static const Property pci_vga_cirrus_properties[] = {
                        cirrus_vga.vga.vram_size_mb, 4),
     DEFINE_PROP_BOOL("blitter", struct PCICirrusVGAState,
                      cirrus_vga.enable_blitter, true),
-    DEFINE_PROP_BOOL("global-vmstate", struct PCICirrusVGAState,
-                     cirrus_vga.vga.global_vmstate, false),
 };
 
 static void cirrus_vga_class_init(ObjectClass *klass, const void *data)
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 18f482ca7f7..32329a499d7 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2495,7 +2495,6 @@ static const Property qxl_properties[] = {
         DEFINE_PROP_UINT16("max_outputs", PCIQXLDevice, max_outputs, 0),
         DEFINE_PROP_UINT32("xres", PCIQXLDevice, xres, 0),
         DEFINE_PROP_UINT32("yres", PCIQXLDevice, yres, 0),
-        DEFINE_PROP_BOOL("global-vmstate", PCIQXLDevice, vga.global_vmstate, false),
 };
 
 static void qxl_pci_class_init(ObjectClass *klass, const void *data)
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index b81f7fd2d0f..562cf526db4 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -338,7 +338,6 @@ static const Property vga_pci_properties[] = {
     DEFINE_PROP_BIT("edid",
                     PCIVGAState, flags, PCI_VGA_FLAG_ENABLE_EDID, true),
     DEFINE_EDID_PROPERTIES(PCIVGAState, edid_info),
-    DEFINE_PROP_BOOL("global-vmstate", PCIVGAState, vga.global_vmstate, false),
 };
 
 static const Property secondary_pci_properties[] = {
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 544bb65320b..c43026bd9c5 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -1335,8 +1335,6 @@ static void pci_vmsvga_realize(PCIDevice *dev, Error **errp)
 static const Property vga_vmware_properties[] = {
     DEFINE_PROP_UINT32("vgamem_mb", struct pci_vmsvga_state_s,
                        chip.vga.vram_size_mb, 16),
-    DEFINE_PROP_BOOL("global-vmstate", struct pci_vmsvga_state_s,
-                     chip.vga.global_vmstate, false),
 };
 
 static void vmsvga_class_init(ObjectClass *klass, const void *data)
-- 
2.47.1



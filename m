Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcvN-0000TQ-2f
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcvH-0000LE-Tl
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:34 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcvF-0002M2-Lh
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:31 -0400
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3d6d162e516so12192865ab.1
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140547; x=1746745347; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKlAvP/b7bRS8YoXdECBwma4F9omGf4fESvbK1cfcEc=;
 b=P7r0+NFBdixDD9pJAWHbaEE7RkA5/vScdf4hTS3Vxm8bIpUeAIx1Dks6KTYejWmXwJ
 7UkfS4SX9hdSBzEWb9ucddbFbP3UUoqBfXvDHdqLtWWqet2OdsIlRa0yLOxJUZWKW6o/
 eC4c0+J+kSF/wnHnI09bsyC/DvYWCT1opLM3KbuIOprka6e1bWH9ciFiJ+QxE1ndiP4C
 Z3Gcb1c4LIPA3TVZFTompAC6rZhgu9xoP0nRP09BizHOH8aHy47rgEAjF3D3npYE0gKh
 FELKA0f9O53TWit5dd2rPob/ceomgaywGszGwD5XdjAPB1lhvFdgZ9RJNI+j5m/9u8CP
 XjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140547; x=1746745347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MKlAvP/b7bRS8YoXdECBwma4F9omGf4fESvbK1cfcEc=;
 b=cqXvaVYNFvfgbDefyWTsVAYiBa2Sjj0YegYBVMR6KqXTX8LoYq+E0fdLeoYTVazq/8
 Kr+Sf+N89z/IJUbqd4N72GwB0/Sz/rattH41c/s/GoyUnpXr3N5YPDfuJNSZGccfX5Hg
 7zjqT1Xc3i3Aei+yAw7i45T15hklNmI0QNW0zWq3wQzmIpVrtSW0FNbyustWx6Tp09ta
 JyPuGjYh0kAxG8dtvkXT+anLTelZ+VBBfi2x43vEDD9lu8Q1DtJlyhvh81dz5LDNjdz8
 xhbfvN3F0e9OgQ9tX8lKibTYfCJNqpGhPcawdbiRPFx+f8AtvfKI/mim1ZxQxQD8hYj9
 LNQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUimgSZS2Opxr8OQ7kAH/nY3yZQ50pYD/az5tq1wDnl9++FdXij32Z3fC2/k9bJGqDxO3Kl1QW270Q=@nongnu.org
X-Gm-Message-State: AOJu0Yzj8NPxCMdFTj2kWJxaTbOV2OKs3srj+9pT9hUebnnJG9DsTzjJ
 eanZWWrZDLZVu1AhFS14VcEghOmoMEPkkOBxI9uugrKcHHuh1Z4CUN/bJw6AY98=
X-Gm-Gg: ASbGncuGynsDbo6r7lw++ZwVIoPDZjg+BD5vo8U8zhqxSuG03DEuXouZOpertjM6mua
 x7m4b9Yveh/74U5ikt+3yShxD1gMHg/c0vlmb9LMMgTGQf636F512VyzMHZUIbPLZbzCGnqbFR+
 OQg/FR93rqp112iVu+GzYmr6vAfthZeITJwA9f1ymN6nO4agiWci144lo7xy44wnfUtX+M7sx8Z
 ilMMM8a7Wmx+X7lD5hJf2yS3LHWIryUaDU1tetdAojuiPCRBcXaBRMlFZeNQ0oOplgag4T4+9/A
 HSNzIvH1SXKNZG66uESDXoGyLZF3+fJlMn+TSpF3kUQE7g3m4rdzcGrIIZ6VXk0sGEQUVOQtybN
 UAuktCQZwuW9/k/oJYxcldCaQMcX21x4=
X-Google-Smtp-Source: AGHT+IHInVtaHMoThBEwz78LYSah4LbqdbEsU5tqkSnQzlF3/xydnsJ0rshcltIpx0QIZNoByYG1Aw==
X-Received: by 2002:a05:6e02:168d:b0:3d3:f6ee:cc4c with SMTP id
 e9e14a558f8ab-3d97be919c5mr8853545ab.0.1746140547164; 
 Thu, 01 May 2025 16:02:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88a8d0e77sm91354173.24.2025.05.01.16.02.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:02:26 -0700 (PDT)
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
Subject: [PATCH 06/10] hw/net/e1000: Remove unused E1000_FLAG_TSO flag
Date: Fri,  2 May 2025 01:01:24 +0200
Message-ID: <20250501230129.2596-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Thu, 01 May 2025 23:02:34 -0000

E1000_FLAG_TSO was only used by the hw_compat_2_11[] array,
via the 'migrate_tso_props=off' property. We removed all
machines using that array, lets remove all the code around
E1000_FLAG_TSO, including the vmstate_e1000_tx_tso_state
subsection.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Is it OK to remove migration subsection like that?
---
 hw/net/e1000.c | 58 +++++++-------------------------------------------
 1 file changed, 8 insertions(+), 50 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index e0310aef872..c68645684b6 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -127,13 +127,10 @@ struct E1000State_st {
     QEMUTimer *flush_queue_timer;
 
 /* Compatibility flags for migration to/from qemu 1.3.0 and older */
-#define E1000_FLAG_TSO_BIT 3
 #define E1000_FLAG_VET_BIT 4
-#define E1000_FLAG_TSO (1 << E1000_FLAG_TSO_BIT)
 #define E1000_FLAG_VET (1 << E1000_FLAG_VET_BIT)
 
     uint32_t compat_flags;
-    bool received_tx_tso;
     bool use_tso_for_migration;
     e1000x_txd_props mig_props;
 };
@@ -1331,7 +1328,7 @@ static int e1000_pre_save(void *opaque)
     }
 
     /* Decide which set of props to migrate in the main structure */
-    if (chkflag(TSO) || !s->use_tso_for_migration) {
+    if (!s->use_tso_for_migration) {
         /* Either we're migrating with the extra subsection, in which
          * case the mig_props is always 'props' OR
          * we've not got the subsection, but 'props' was the last
@@ -1368,30 +1365,16 @@ static int e1000_post_load(void *opaque, int version_id)
     }
 
     s->tx.props = s->mig_props;
-    if (!s->received_tx_tso) {
-        /* We received only one set of offload data (tx.props)
-         * and haven't got tx.tso_props.  The best we can do
-         * is dupe the data.
-         */
-        s->tx.tso_props = s->mig_props;
-    }
+
+    /* We received only one set of offload data (tx.props)
+     * and haven't got tx.tso_props.  The best we can do
+     * is dupe the data.
+     */
+    s->tx.tso_props = s->mig_props;
+
     return 0;
 }
 
-static int e1000_tx_tso_post_load(void *opaque, int version_id)
-{
-    E1000State *s = opaque;
-    s->received_tx_tso = true;
-    return 0;
-}
-
-static bool e1000_tso_state_needed(void *opaque)
-{
-    E1000State *s = opaque;
-
-    return chkflag(TSO);
-}
-
 static const VMStateDescription vmstate_e1000_mit_state = {
     .name = "e1000/mit_state",
     .version_id = 1,
@@ -1416,28 +1399,6 @@ static const VMStateDescription vmstate_e1000_full_mac_state = {
     }
 };
 
-static const VMStateDescription vmstate_e1000_tx_tso_state = {
-    .name = "e1000/tx_tso_state",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .needed = e1000_tso_state_needed,
-    .post_load = e1000_tx_tso_post_load,
-    .fields = (const VMStateField[]) {
-        VMSTATE_UINT8(tx.tso_props.ipcss, E1000State),
-        VMSTATE_UINT8(tx.tso_props.ipcso, E1000State),
-        VMSTATE_UINT16(tx.tso_props.ipcse, E1000State),
-        VMSTATE_UINT8(tx.tso_props.tucss, E1000State),
-        VMSTATE_UINT8(tx.tso_props.tucso, E1000State),
-        VMSTATE_UINT16(tx.tso_props.tucse, E1000State),
-        VMSTATE_UINT32(tx.tso_props.paylen, E1000State),
-        VMSTATE_UINT8(tx.tso_props.hdr_len, E1000State),
-        VMSTATE_UINT16(tx.tso_props.mss, E1000State),
-        VMSTATE_INT8(tx.tso_props.ip, E1000State),
-        VMSTATE_INT8(tx.tso_props.tcp, E1000State),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
 static const VMStateDescription vmstate_e1000 = {
     .name = "e1000",
     .version_id = 2,
@@ -1519,7 +1480,6 @@ static const VMStateDescription vmstate_e1000 = {
     .subsections = (const VMStateDescription * const []) {
         &vmstate_e1000_mit_state,
         &vmstate_e1000_full_mac_state,
-        &vmstate_e1000_tx_tso_state,
         NULL
     }
 };
@@ -1637,8 +1597,6 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
 
 static const Property e1000_properties[] = {
     DEFINE_NIC_PROPERTIES(E1000State, conf),
-    DEFINE_PROP_BIT("migrate_tso_props", E1000State,
-                    compat_flags, E1000_FLAG_TSO_BIT, true),
     DEFINE_PROP_BIT("init-vet", E1000State,
                     compat_flags, E1000_FLAG_VET_BIT, true),
 };
-- 
2.47.1



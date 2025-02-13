Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiXNV-0007o8-MB
	for mharc-qemu-rust@gnu.org; Thu, 13 Feb 2025 06:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiXNU-0007nl-Sh
 for qemu-rust@nongnu.org; Thu, 13 Feb 2025 06:27:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiXNT-0002bu-0w
 for qemu-rust@nongnu.org; Thu, 13 Feb 2025 06:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739446049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WszW0NxKZSYHFFSiUB5cJcU961As2uXrLrk50UN0l2U=;
 b=CsSUfZ3o3wKAOMQoiyBIS56r4N4jfRAVe2QM1AM7MWYNqMTQR+b3vtulmen/AsFSvy4S7J
 j+cw3BSoIT3fBFoADT4ABAh7ecvyxKq/9yiMCTS1hPV01xt9M38Ltx9pz0xRXVuC8JrN6d
 HFV129r39yM0PcVINvWq+hPod3TxNvw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-nQ8az8HNN7mFzj61miLJkg-1; Thu, 13 Feb 2025 06:27:28 -0500
X-MC-Unique: nQ8az8HNN7mFzj61miLJkg-1
X-Mimecast-MFC-AGG-ID: nQ8az8HNN7mFzj61miLJkg
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38f27acb979so283887f8f.0
 for <qemu-rust@nongnu.org>; Thu, 13 Feb 2025 03:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739446047; x=1740050847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WszW0NxKZSYHFFSiUB5cJcU961As2uXrLrk50UN0l2U=;
 b=Lh9qBbjngQnw9Tt3PKhGrIuHwrwwCEIR6ICh01bQV+vLkBRdYiCSGejhsbFeIlk4Pu
 69Pu9jyd1rqAWGBBtaKRzr6YTh9lWQ0K4G59zwOl+RTHFKeCUu6PWr5NSwtcqQ2PrTaD
 eMxHk6Cysx0aIqPg7QEk3EJ4cUdWOoCzRCclcRGagaP4RsDa6SboW+bDcpidPnPpcva1
 bsRv9T4nia8AY6wipFs/bvv9H0oqs4CCl0q3y+MRrBNpuFpACMav3ck0mA84QLMtqwwd
 iHc/AMtaydKfyy2CHK49tpM4YnRTSGd6UudNPQaJBAcZ3Lg88TMU6JmxND91ExaKpm/w
 6gPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ2k19l5OO64hSV+Vq+Ppfv9jJfTwAp2rf2B+0z83v2EDaAIOkdSKkQoDJBEsYlU3lPMcEH+swuGE=@nongnu.org
X-Gm-Message-State: AOJu0Yys/VN6n4ENCHEWR7gzitS8ivDHSBQqncxgwn005PWD8BAOxwl6
 1i4zifwxyPlr9D95JTak6o+C4IrXGSfvjtdUy2LqvMogjqR7L/Ijbea690d2v9SSxUjumGW6cIJ
 SoczzNFUEGvkHczIG1RmDD5DXXpGcnkhxnv8ach5Ish7uYo8nPVI=
X-Gm-Gg: ASbGncsfwNMzcHGVNLyHCW3b1bUlv+6Q8NBx3QO8XEfCblD2PqWnICrZ6D0e0kjyWS1
 F1D+D3harucOWcS58RKIT4DapDzangTHuN4l1/iU2iBhouq2FDZMn2BrpejulnvwOP5x1sfo6a5
 seWiVfm7gtwPALm8LzgI+B6pkySzUydihylAH40YTEJJM6coLlSslPSP3XrkLVnjCWlEHiE3lpB
 k9FbkfB+CI6p8vSeyCJZCE5IgUcEUNQ2dULQzb8jWtaCOvbB1G0wg/OB/7dKmFJD9qjH2yhfWfD
 x28fwUBt8g==
X-Received: by 2002:a5d:59a5:0:b0:38d:e3db:9058 with SMTP id
 ffacd0b85a97d-38dea2706bdmr5089256f8f.12.1739446047326; 
 Thu, 13 Feb 2025 03:27:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlnFSeO2p9WVFB42H7rNJM2srb/DJKI+83tpwQj42tzHfE5/ndxvH6dLXs0C2fugHogyt4Xw==
X-Received: by 2002:a5d:59a5:0:b0:38d:e3db:9058 with SMTP id
 ffacd0b85a97d-38dea2706bdmr5089220f8f.12.1739446046868; 
 Thu, 13 Feb 2025 03:27:26 -0800 (PST)
Received: from [192.168.10.48] ([151.49.218.237])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7df2sm1597545f8f.84.2025.02.13.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 03:27:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: junjie.mao@hotmail.com,
	qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH] rust: docs: document naming convention
Date: Thu, 13 Feb 2025 12:27:22 +0100
Message-ID: <20250213112722.3850356-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 74IS8tpQCt1qiFERoejfRy0i9K7g4ip--5pUh73sWxw_1739446047
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Feb 2025 11:27:33 -0000

As agreed in the "vtables and procedural macros" thread on
the mailing list.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 390aae43866..8cccca7a734 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -194,6 +194,50 @@ module           status
   interface either.  Also, ``unsafe`` interfaces may be replaced by safe interfaces
   later.
 
+Naming convention
+'''''''''''''''''
+
+C function names usually are prefixed according to the data type that they
+apply to, for example ``timer_mod`` or ``sysbus_connect_irq``.  Furthermore,
+both function and structs sometimes have a ``qemu_`` or ``QEMU`` prefix.
+Generally speaking, these are all removed in the corresponding Rust functions:
+``QEMUTimer`` becomes ``timer::Timer``, ``timer_mod`` becomes ``Timer::modify``,
+``sysbus_connect_irq`` becomes ``SysBusDeviceMethods::connect_irq``.
+
+Sometimes however a name appears multiple times in the QOM class hierarchy,
+and the only difference is in the prefix.  An example is ``qdev_realize`` and
+``sysbus_realize``.  In such cases, whenever a name is not unique in
+the hierarchy, always add the prefix to the classes that are lower in
+the hierarchy; for the top class, decide on a case by case basis.
+
+For example:
+
+========================== =========================================
+``device_cold_reset()``    ``DeviceMethods::cold_reset()``
+``pci_device_reset()``     ``PciDeviceMethods::pci_device_reset()``
+``pci_bridge_reset()``     ``PciBridgeMethods::pci_bridge_reset()``
+========================== =========================================
+
+Here, the name is not exactly the same, but nevertheless ``PciDeviceMethods``
+adds the prefix to avoid confusion, because the functionality of
+``device_cold_reset()`` and ``pci_device_reset()`` is subtly different.
+
+In this case, however, no prefix is needed:
+
+========================== =========================================
+``device_realize()``       ``DeviceMethods::realize()``
+``sysbus_realize()``       ``SysbusDeviceMethods::sysbus_realize()``
+``pci_realize()``          ``PciDeviceMethods::pci_realize()``
+========================== =========================================
+
+Here, the lower classes do not add any functionality, and mostly
+provide extra compile-time checking; the basic *realize* functionality
+is the same for all devices.  Therefore, ``DeviceMethods`` does not
+add the prefix.
+
+Whenever a name is unique in the hierarchy, instead, you should
+always remove the class name prefix.
+
 Common pitfalls
 '''''''''''''''
 
-- 
2.48.1



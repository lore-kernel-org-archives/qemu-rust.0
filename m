Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5D2CE8D6B
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKttg-0003Vr-Je; Mon, 17 Nov 2025 02:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtsw-0003Rg-Dn
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:42:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtsu-0005uY-9N
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C0Y4M8+NX7tANAXldXz3ofawHVWZXdO3U/J/Xyv4eaM=;
 b=HaFKt9uJeAVlt4/DOi3GP7iITrwos8GXhJMevctNn/kU1C/fQXClI+B1TJ979dBrNsszNR
 wKASqvzw9+R/gBgBQEpFNWh3Wj0pa8wm4Y37Ugb+k6K328Wt9bClheT3MJNsE4ucbB7fdY
 WmZSFPvqPeu6edZxbNEML//12mZD4cM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-cP3KqD_KP46bprdY5HQlcQ-1; Mon, 17 Nov 2025 02:42:43 -0500
X-MC-Unique: cP3KqD_KP46bprdY5HQlcQ-1
X-Mimecast-MFC-AGG-ID: cP3KqD_KP46bprdY5HQlcQ_1763365362
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42b3c965ce5so2737318f8f.2
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365361; x=1763970161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C0Y4M8+NX7tANAXldXz3ofawHVWZXdO3U/J/Xyv4eaM=;
 b=IHwtSrHZ1VP6RFCRqV3w5cLMgCyEXJNoAFMPI2A1libnmVt1c7FpZHj6cOTXpbTg3p
 gkq0Ree5Pzt3A/AH0e2Z0pcznXmKY6t8+kVKdOuSmRrJX9N+cj4e8o5mxVFiZzsOXXR9
 N7qcGV8XWgQcjbVL92VR/pGYnI7JFFaVDS4j5372MqpjtM/nTd1vdXPzmWNZLoDHpQmZ
 mRQ9FsMkBuXUE3QEnBAKRWAhYNC+x1U/fVztsYd8k6imLIbPU6/KdoKowm2pZN/c+kTE
 NDG1nHqoh0o0HU9DlAVXJq44F03WSn4Wi3ouMcsRtUdA333SHCSFA2M2oo2HKDdtwf83
 ps5A==
X-Gm-Message-State: AOJu0Yw4b8ZAbM/tpwNipM016hHKAf9gEQLL1jbfqrAnZ63WUS6zkrNL
 n521kFWa4aPL7JxLvq91DxoyUDRKSBsqbhw0/TS59dEWKI1F0leAdQNNxgB99PtM9iHCdQ6otSv
 p1Lt/TWXl2QMnpycZppqU/cXcDsVL6Fr3FFdt6yQCwuCkAf1a2AnzPQb6GQiVEd4=
X-Gm-Gg: ASbGncu09jqrR/nCtv0ekBYRBvZXGE+yxit5Q99GsHdI0OmD2N+JnF/dydM1ed1OYJO
 fRJanpUCqY5EWbV6jnF8VC5tTj+BQFYqwHQTWk5ynrQvkm6bWfsQaWeBtBnySYo6aeYejY4S5nW
 E4KB4Zi/o8kD7HukTtZuAPg0CBlsVxDNoTvRsBVbAbRMViPI/GtL7MC0GBoxZyIIBD+NYPqARlv
 LcEHwqELdTB28lLMN3cBAdLOxXpWqP+wIQQlec9rYEc1DlB49BvM6YZ+csmBYXel8Fmb/Ej+N8D
 agP79Z37u+fhg4XSHLANeV2Gue28ACoaUVcsFHXcRQ+6Ux0L7YUXUMxgIr61G3RGWioEvpWsZAZ
 0TcbCm+qxkxua/RuUqVhJgBr98++x+lVzQupXJNFUlGw2PnlpRPcNO0WwH4OE3TFDvllJ876XNB
 Ksnf9P
X-Received: by 2002:a05:6000:2913:b0:429:c851:69b3 with SMTP id
 ffacd0b85a97d-42b5938687bmr11168240f8f.30.1763365361279; 
 Sun, 16 Nov 2025 23:42:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6uqIQNfbp1MOz1J/AjjpFXN4eYcOq8wtb9PtoJW1kLHKT5b2O3HLURN9g00ellg+coUOPLQ==
X-Received: by 2002:a05:6000:2913:b0:429:c851:69b3 with SMTP id
 ffacd0b85a97d-42b5938687bmr11168200f8f.30.1763365360831; 
 Sun, 16 Nov 2025 23:42:40 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7ae5bsm24647881f8f.8.2025.11.16.23.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/8] rust: add preludes to all crates
Date: Mon, 17 Nov 2025 08:42:30 +0100
Message-ID: <20251117074239.190424-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TWfYxQ3q-yfFrniued6t6cXfruyqaye8yg8PROgoOzg_1763365362
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This series adds a prelude module to all crates, so that
it becomes possible to import from each crate with either
of the following

   use XYZ::prelude::*;
   use XYZ::{self, prelude::*};

The latter is used for items that have a "too common"
name to be put in the prelude: util::Error, util::Result,
migration::Infallible.

Thanks,

Paolo

Paolo Bonzini (8):
  util: add prelude
  common: add prelude
  hwcore: add prelude
  migration: add prelude
  chardev: add prelude
  bql: add prelude
  system: add prelude
  qom: add more to the prelude

 rust/bql/meson.build              |  1 +
 rust/bql/src/lib.rs               |  5 +++++
 rust/bql/src/prelude.rs           |  4 ++++
 rust/chardev/meson.build          |  1 +
 rust/chardev/src/chardev.rs       |  2 +-
 rust/chardev/src/lib.rs           |  5 +++++
 rust/chardev/src/prelude.rs       |  5 +++++
 rust/common/meson.build           | 13 +------------
 rust/common/src/lib.rs            |  5 +++++
 rust/common/src/prelude.rs        |  9 +++++++++
 rust/hw/char/pl011/src/device.rs  | 22 ++++++++--------------
 rust/hw/core/meson.build          |  1 +
 rust/hw/core/src/lib.rs           |  5 +++++
 rust/hw/core/src/prelude.rs       | 14 ++++++++++++++
 rust/hw/core/src/qdev.rs          |  2 +-
 rust/hw/core/src/sysbus.rs        |  2 +-
 rust/hw/core/tests/tests.rs       |  8 ++++----
 rust/hw/timer/hpet/src/device.rs  | 26 +++++++++-----------------
 rust/hw/timer/hpet/src/fw_cfg.rs  |  2 +-
 rust/migration/meson.build        |  1 +
 rust/migration/src/lib.rs         |  5 +++++
 rust/migration/src/migratable.rs  |  2 +-
 rust/migration/src/prelude.rs     | 19 +++++++++++++++++++
 rust/qom/src/prelude.rs           |  4 ++++
 rust/system/meson.build           |  1 +
 rust/system/src/lib.rs            |  5 +++++
 rust/system/src/prelude.rs        |  8 ++++++++
 rust/tests/tests/vmstate_tests.rs |  7 +++----
 rust/util/meson.build             |  1 +
 rust/util/src/lib.rs              |  5 +++++
 rust/util/src/prelude.rs          | 11 +++++++++++
 31 files changed, 145 insertions(+), 56 deletions(-)
 create mode 100644 rust/bql/src/prelude.rs
 create mode 100644 rust/chardev/src/prelude.rs
 create mode 100644 rust/common/src/prelude.rs
 create mode 100644 rust/hw/core/src/prelude.rs
 create mode 100644 rust/migration/src/prelude.rs
 create mode 100644 rust/system/src/prelude.rs
 create mode 100644 rust/util/src/prelude.rs

-- 
2.51.1



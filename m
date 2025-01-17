Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCs-0001d3-55
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCq-0001bq-Ab
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCo-0002DM-0E
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A81qJn2EL6E/QyMc/gOAoSx6A9iJTPC6iOP+Z5fufcI=;
 b=UmbN693iSxVIMQf0FqdkA/K6q63kHZVxQowEAOZxcPH3ifo5DS6fRycdqt/fHQU5nXyY/b
 2LviB1cPdWbbCmE+z6lsOn49iKOMliv7JAY4la6OYnd06dwuFMSI63JzSQJkGbmpr88Lkd
 uHoqGLU26ERORFjjshFUWwVmHbQSrTI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-K8l1_2JVNVq6oseO5noVdQ-1; Fri, 17 Jan 2025 14:40:24 -0500
X-MC-Unique: K8l1_2JVNVq6oseO5noVdQ-1
X-Mimecast-MFC-AGG-ID: K8l1_2JVNVq6oseO5noVdQ
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa6732a1af5so281325466b.3
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142823; x=1737747623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A81qJn2EL6E/QyMc/gOAoSx6A9iJTPC6iOP+Z5fufcI=;
 b=MjvydqRSzsdUmAND7mAjPnIvzjEklE8/kZTSeYuFKxenKfnRgZNkdJ1u2YGVU259kj
 Z5le1n42CteKErQ4pQ+qNQ364olSuc665tO+WCTyY2qPcnMYtchFt2Z4eZAphJs1b2mE
 uSifcOuWJmQLmKB0b2tXbCMo01pH9ZmEmiv7ADipO5izSeUdtHcJRHXuwLuyZaL+h8uW
 syGOV4NV2F3PYSDhnYw+BDsa7Nf8wQ7GXtZUecR+uZpc63gYjtVmLm2lr9oReFeNyCcW
 CKHjDoZc22sNGBoW7/zUA9JxprLrSysM4P/lBITAp2PMSZd39Knio7WEiEk9pI64OgDm
 GaUg==
X-Gm-Message-State: AOJu0YxIZ35Lol2M9hNNDZHNhwLhSOFSlTrG0MF6eLXhulfGFHVGlbMN
 Vg8Kg/lDKrAaObIPj/kLDKStLKlaoTyo9BUfbiK0oZ5hjUo36NrEiiWr8VsViFMw0LrW3v67k1k
 3l8PE2WfGVo3PIyFY25xbyIPV5e0gABdFIdvKid6mAUf9TzpXSFLTlNjiaZXlpQ==
X-Gm-Gg: ASbGncv0lEQgQacDu1mdSCQBwyme/GHaOfpnsZ6EXbeNQ+qVLSI7vJ521qjQwftwFoW
 bobWgYFAPr0SmcpQJl2KCjCiRAXe4Zzu5lK77WFZGhjUFn8QBWw+60DDl1UuH+2vUlnW1A7TrZF
 RzjETC9syvlOrNNrV7bH6WCybnSfLV3swSRWs6Fp65v/ltdQrOxTz26+aq9bvFcIYWKH/V0G3Ci
 Z8213/y8cBnpHmBBksl0MMm5WVeX+5Px03FMGbOTdaXKrIwMCiB3NIBA/C0Xg==
X-Received: by 2002:a17:907:9802:b0:aae:8491:bab5 with SMTP id
 a640c23a62f3a-ab38b30e1admr345573466b.26.1737142823207; 
 Fri, 17 Jan 2025 11:40:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2DRY5RAxoi0USi7TxLjP6LuLwhm7HLPfDLog2RFrIdUOus5b4CwuEYkSzedMlE9HVgpG5AA==
X-Received: by 2002:a17:907:9802:b0:aae:8491:bab5 with SMTP id
 a640c23a62f3a-ab38b30e1admr345571766b.26.1737142822809; 
 Fri, 17 Jan 2025 11:40:22 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab3848b2047sm218476466b.0.2025.01.17.11.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 07/10] rust: qdev: make ObjectImpl a supertrait of DeviceImpl
Date: Fri, 17 Jan 2025 20:40:00 +0100
Message-ID: <20250117194003.1173231-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117194003.1173231-1-pbonzini@redhat.com>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C7NrfqEPIugsVPYUEYY0-oweWU_frORKaaRTK3-F4Xw_1737142824
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:36 -0000

In practice it has to be implemented always in order to access an
implementation of ClassInitImpl<ObjectClass>.  Make the relationship
explicit in the code.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/qdev.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index f573712550e..ab883e2faef 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -21,7 +21,7 @@
 };
 
 /// Trait providing the contents of [`DeviceClass`].
-pub trait DeviceImpl {
+pub trait DeviceImpl: ObjectImpl {
     /// _Realization_ is the second stage of device creation. It contains
     /// all operations that depend on device properties and can fail (note:
     /// this is not yet supported for Rust devices).
-- 
2.47.1



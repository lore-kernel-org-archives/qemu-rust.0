Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCwdu-0001VD-5s
	for mharc-qemu-rust@gnu.org; Thu, 08 May 2025 04:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCwdg-0001Pr-Mt
 for qemu-rust@nongnu.org; Thu, 08 May 2025 04:29:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCwde-0008DV-Qr
 for qemu-rust@nongnu.org; Thu, 08 May 2025 04:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746692992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KM1SQb3E2Vsp14fCIyp5AKJJoRWd570avF7cZiuylIE=;
 b=hNjtDFShcT7QNTMfUW79X3Oe4UwM8sseoqU7DOoTBG7Z7mKPtwY18T36yY4PlpBz6f9inz
 fk0PN20jVkkiYLSCXzlc+L0gDNZhyhP7hVhjM2WKsSo7KdZc7eA8ti5KqwdJ3BbGKVSGWL
 zz1maUUxT/lhoHQRCGlNypZmC0NRVUc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-bA1_xapdOemGdT5MExCuEA-1; Thu, 08 May 2025 04:29:48 -0400
X-MC-Unique: bA1_xapdOemGdT5MExCuEA-1
X-Mimecast-MFC-AGG-ID: bA1_xapdOemGdT5MExCuEA_1746692985
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43efa869b19so4392165e9.2
 for <qemu-rust@nongnu.org>; Thu, 08 May 2025 01:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746692985; x=1747297785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KM1SQb3E2Vsp14fCIyp5AKJJoRWd570avF7cZiuylIE=;
 b=MVbI/vRwYGUEH2UYvhsan8jb/1eJCY8Oe/4rEF9i0QgTFm2yl7MvHiFl28z7l/qgjz
 Ruu6gXC+VDapNqV2SR0i+m8+Ozez7R3PHga8gSEWNQFuyprw6NSIrLXnRTKJcvoJNy/B
 kOVtNuC0T4uf6st3Tfdguhr6Xg1DmON3tUfoAsXEkCbQiebwzG6DbULLWHcG7sRwwF6f
 5AdiNJmDAqnr7O2tysmpC1Ay2Oof5eENtgNpPTpt18buGJmhM+iV7zot251mNlmRMqLY
 ntpGy69yn22j92g6eQEe25CX1Y5MJ0u/f2H4/UcRX9xxnLZONJ+itcDN5twDZhwv+Dd3
 oAoA==
X-Gm-Message-State: AOJu0YxPMnMg8mHSeFOzVhJxtAeOrHzrqsoLG9V+QrPoC71Qd1fKl+ig
 hIRdxVyF1DDvb0I+MlmzyGOHXEMidCTYuiI+e063GOoCiR/zhEyMUFbmNPRQiSdUxytCPrOzoHd
 kuGzOhx7smaEhdAFxlKq2WotG9qW8mUKxJ+jEcC20/ZVlp3IVzj4=
X-Gm-Gg: ASbGncsZ2eO9NqZBwSa/tKyReMAFCta2beidv+rp9nJW8xAz8girH/nP/xBGKRaUtsC
 oaAW8uCJXLYm0Gi8C8JjugmwtmJPJMCiTphdVqYdfkUv3K4i+3tNn4Kn0xGATbv/bc2gb7llB4i
 llPsFLfjwP51eFRD81m2YOZIgyF59XaUdP1HRpGBvnFcBjKUG733+oBdpfMWWz0MI+f8RnHSZxU
 yF9TY2+C4AepDkth55tec61jxbYKcc0YoRb61/9qsetkdIAM7IIkMMfMr9w7l2VzO0SguD9HKf7
 lIl8xN6Ray4Kn04=
X-Received: by 2002:a05:600c:4688:b0:43d:fa59:be38 with SMTP id
 5b1f17b1804b1-441d44e58b2mr49827835e9.32.1746692984923; 
 Thu, 08 May 2025 01:29:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM1V7x0XCOwlJ1KWQ5SVitAW0DJD6hkdnamlLcSdXdp1dpU0BjEYxl8hQTxqajmbwU43UBMw==
X-Received: by 2002:a05:600c:4688:b0:43d:fa59:be38 with SMTP id
 5b1f17b1804b1-441d44e58b2mr49827645e9.32.1746692984601; 
 Thu, 08 May 2025 01:29:44 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd351315sm28692405e9.19.2025.05.08.01.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 01:29:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/2] rust: pl011: really use RX FIFO depth
Date: Thu,  8 May 2025 10:29:41 +0200
Message-ID: <20250508082943.446512-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ny5zekZAP7hn_3ty-J7JCQX3Do0YhDRCSqFxDcQ6EIU_1746692985
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
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
X-List-Received-Date: Thu, 08 May 2025 08:30:05 -0000

Forward port a couple more commits from the C version.

Paolo

Paolo Bonzini (2):
  rust: pl011: Rename RX FIFO methods
  rust: pl011: Really use RX FIFO depth

 docs/devel/rust.rst              |  2 +-
 rust/hw/char/pl011/src/device.rs | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.49.0



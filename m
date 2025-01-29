Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1td3ZW-0002wL-Jx
	for mharc-qemu-rust@gnu.org; Wed, 29 Jan 2025 03:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td3ZU-0002vK-CT
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td3ZS-0006Vp-1P
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738139832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z39SMo5fMi5Iw581fDH9qIPvAtJD2ehQKZCfZcwRJGY=;
 b=htNCtnhKScX2hsfGUf5La3zt5t5yUc5/dmYaB7bR7r1ZqwPh0p7b6PkEa9e92OvjClHSTx
 jyZjeiP1SOwSplaFv5GRYp8q4/2GYQzEdHLUjZ5cILYwwanci08DUgehudcv3XP0cIu8pm
 TnVPAXL2jCA0KKlrtKR2ZscJjrx9+UA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-Mfb0hvCRMtSxcnPPJtWvvg-1; Wed, 29 Jan 2025 03:37:08 -0500
X-MC-Unique: Mfb0hvCRMtSxcnPPJtWvvg-1
X-Mimecast-MFC-AGG-ID: Mfb0hvCRMtSxcnPPJtWvvg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43651b1ba8aso45371035e9.1
 for <qemu-rust@nongnu.org>; Wed, 29 Jan 2025 00:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738139827; x=1738744627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z39SMo5fMi5Iw581fDH9qIPvAtJD2ehQKZCfZcwRJGY=;
 b=Y4Km8Q/Ay5ydaAgHdJsz1/AcnBwaWNgdrcCo69BZ+TncuhdMFlg67Ir9I/bzb+CKf6
 peXQtFreb3mNIApoN7hX8br/ufBOo7QTIfYAyXj4AVhClzi9YC3rWCl+uTY4Di/Pn2X5
 tZu5zmTb+I6UcOSaJWY+4PeXXRpukQCeGZwvzrlXwi2HKIitX+lMD8NpsQb/lV6XtEHp
 P7BWPlsOEkf3JShTWess1OrcXu/4cuclbCIiYhb7bXS6CN2UKWp+LJVCjsOZQ/c3KA6n
 9+2Ev9E57bexrs0L2wTamAJi1WsOkUIK+8ZLJuTv+1Nd8H7p/lKLkxo/0wE3Hj9sB1Ye
 nAHg==
X-Gm-Message-State: AOJu0Yxsv+yH8ua2/DkD7YbfoDO7lFrymFX0a4xqYIh7sXIpayQfEieM
 6j4zi8IQ/vtkK87QfClTbjca+n8lP1ZZZMdO3gShedTviZHjK75cSjeAeMeBNlLHcbR8NintvdP
 72NWhwzHXWTYGtMLqneIKN0Zxcgv3iUNwJqMI4xyvKrohmNXEvmY=
X-Gm-Gg: ASbGncvVB6qnAm3vD9ia+LdvSPuW/fZThFkRfbmo+s7rekELmNTfRM+GVFe+ybA3Fjd
 AXr7sTY4JOiPhP3zbdnYLRc6lgh4us2ILIPGtfb6FnZKR/bo/qog7i3ErimsLKnA5VWH95k9JHZ
 DJh+bqVMPBcLWxCbOXrfxCxo8xpzXAXliTjnRSzUtMwnhCDnsKl9yAbIe5WCGtxMQnnJ8PMb4FI
 oBi+4vrjRCPSFEvIqMDc4v9Fw693W+GY+cn2efgflQ129RXN0aXTOxJ6ju3LzXLRegQwVuGpTED
 07cBig==
X-Received: by 2002:a05:600c:1d83:b0:434:a781:f5d5 with SMTP id
 5b1f17b1804b1-438dc43540bmr17232225e9.30.1738139827661; 
 Wed, 29 Jan 2025 00:37:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRVnVACXbe2o5UFdWmFh32QWJzcSMoeuoo/SloXi5oWk7LyjTRgab9mbySxerp+6u4mScZCQ==
X-Received: by 2002:a05:600c:1d83:b0:434:a781:f5d5 with SMTP id
 5b1f17b1804b1-438dc43540bmr17231985e9.30.1738139827318; 
 Wed, 29 Jan 2025 00:37:07 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2ef08sm14586025e9.22.2025.01.29.00.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 00:37:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/2] rust: small cleanups to Cargo.toml files
Date: Wed, 29 Jan 2025 09:37:02 +0100
Message-ID: <20250129083705.1321407-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OHeQBIJ-0TSQ8bE1m5A2gm0VieWRKdd3XzkW1uceseY_1738139828
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jan 2025 08:37:16 -0000

Remove duplicate or stale information, and add the rustc version to
help clippy produce good warnings.

Paolo

Paolo Bonzini (2):
  rust: remove unnecessary Cargo.toml metadata
  rust: include rust_version in Cargo.toml

 rust/hw/char/pl011/Cargo.toml          |  4 +---
 rust/hw/char/pl011/README.md           | 31 --------------------------
 rust/hw/char/pl011/src/device_class.rs |  1 -
 rust/hw/char/pl011/src/lib.rs          | 14 +++++-------
 rust/qemu-api-macros/Cargo.toml        |  4 +---
 rust/qemu-api-macros/README.md         |  1 -
 rust/qemu-api/Cargo.toml               |  1 +
 7 files changed, 9 insertions(+), 47 deletions(-)
 delete mode 100644 rust/hw/char/pl011/README.md
 delete mode 100644 rust/qemu-api-macros/README.md

-- 
2.48.1



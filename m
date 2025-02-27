Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnh1N-0008Rj-F5
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 11:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh1B-0008KH-Ki
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:45:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnh18-0007nD-O8
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 11:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740674744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wVAr7MFEIkeCBVn/8Zyjx311WrTsE+8/auwtseqk9Kg=;
 b=FJacyB1fpocCs8zdQ1LMeiSNzBF604fC+uyPnQm4qEXOP8OUoUThb3eH6f+Dwt4QEDbvL+
 bzYzS2RXExEizQPID/9CFmfins7xAqtN2YCWi8yILfWwcLvO9VZpknAtl9RyzOVp9aC5R0
 6RZxYtvjJoe12bJA8RFkGNtgJ+/lBzw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-BypWDdQjMFCaKPdED2rBEQ-1; Thu, 27 Feb 2025 11:45:42 -0500
X-MC-Unique: BypWDdQjMFCaKPdED2rBEQ-1
X-Mimecast-MFC-AGG-ID: BypWDdQjMFCaKPdED2rBEQ_1740674740
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-abf2185ecbcso33476766b.3
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 08:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740674740; x=1741279540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wVAr7MFEIkeCBVn/8Zyjx311WrTsE+8/auwtseqk9Kg=;
 b=APHD/fR7B3/WRh6fev6TnSEIxLyE+/OvkrbWaJbjUiDDeNywe3F0v0bGIqtlA21Z2P
 vArkhvRK4SVd2k0aopi9+e9JoSl33ccbuRiIPwIkzvFEhqgcX0ybG0y3NMZAIdCdmksf
 kX5GIi+NRSmdjrLDby5qsXVxaCutZ/6L6cRMsZC23CAJPeIfi7mSN8PyDprtjHRujzN9
 OA6YEqM29dtBgjveo+UtyBQQZBeLvbKyJCvsSrvjqoI5vRIxG+xs30jnfGjT/xTEYGi8
 ft0/W1HeIRK2CbuVMVHE7o4HpL0neTfkaeaUMhwQiSl7QPQweroXSaTf5vMNZ5ywcB2N
 zWkw==
X-Gm-Message-State: AOJu0Yxs+XtdqmmnGvAFTIrkhZuwQJzBiO5JrgRoaE65ab9xOBE+PfRS
 1pN216dawrrUoYG1VLWQdku6TxnrMN6aJIEBDwb/gjMqSHozhw/uZs4KnhClgfwXzJMlc76bNkK
 MLGWyERly+9Eulnk41zx1IUfJizh6qaFU7mW8HmbL1oaUpe4vJwE=
X-Gm-Gg: ASbGncvkK8bOLSoQv8h6JF1fTMlpEJ+Etwm2voPQeJeQ5lXHf36ECcpGpTYuruxQDqC
 b6v2kC07I+Sz5Fc5sZ4kkX0UFGTcMGzK63jJAIMSWtIVb2EDzyeCUUNekU2qIzQ3bY5PN8Dw/PF
 YkUdHd3yLMWUzvPpym+Avtk2UvjkF8WIldmjpqBUqhHsuAVap8beTIL26Sl1CFbvwm0YH4q1f2t
 BrPKV7Z0vf5BezLJbC3FeV0s7rBQy0NPyt/6FnWOSANmgXGvINQFBqTAXZLH+TnDXmqHPR3U60U
 K801yGatQPDJQ3KKWg==
X-Received: by 2002:a17:906:c14c:b0:ab6:dbd2:df78 with SMTP id
 a640c23a62f3a-abf265d5f40mr10042866b.35.1740674740054; 
 Thu, 27 Feb 2025 08:45:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVICs7YosIKdvQcANivRuQITr8x9SCFmOjcIuOagDNwYB2/tynqNs9teU8KdaRali8adqQEg==
X-Received: by 2002:a17:906:c14c:b0:ab6:dbd2:df78 with SMTP id
 a640c23a62f3a-abf265d5f40mr10040766b.35.1740674739704; 
 Thu, 27 Feb 2025 08:45:39 -0800 (PST)
Received: from [192.168.1.84] ([93.56.163.127])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c755d22sm146958166b.129.2025.02.27.08.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:45:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 0/5] rust: pl011 cleanups + chardev bindings
Date: Thu, 27 Feb 2025 17:45:29 +0100
Message-ID: <20250227164538.814576-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RYR2fePRWeKuRSr-3nS8tXAYG72e_dHvDe9PsgyKfkY_1740674740
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Thu, 27 Feb 2025 16:45:52 -0000

With this series, the only remaining use of unsafe is for vmstate's post
load callback, which is small and self contained.  All functionality
used by pl011 and HPET devices are wrapped in Rust APIs, so they look
like what a "real" from-scratch Rust device would be.

Patch 2 is best reviewed with "git diff -b --color-moved" or similar.

Paolo


Paolo Bonzini (5):
  rust: chardev: provide basic bindings to character devices
  rust: pl011: move register definitions out of lib.rs
  rust: pl011: clean up visibilities
  rust: pl011: switch to safe chardev operation
  rust: pl011: pass around registers::Data

 rust/hw/char/pl011/src/device.rs    | 146 +++-----
 rust/hw/char/pl011/src/lib.rs       | 509 +---------------------------
 rust/hw/char/pl011/src/registers.rs | 507 +++++++++++++++++++++++++++
 rust/qemu-api/meson.build           |  17 +-
 rust/qemu-api/src/chardev.rs        | 237 ++++++++++++-
 rust/qemu-api/src/zeroable.rs       |   1 +
 6 files changed, 800 insertions(+), 617 deletions(-)
 create mode 100644 rust/hw/char/pl011/src/registers.rs

-- 
2.48.1



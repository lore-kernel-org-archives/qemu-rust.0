Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u10Pq-00076i-C8
	for mharc-qemu-rust@gnu.org; Sat, 05 Apr 2025 06:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u10Po-00075j-Ga
 for qemu-rust@nongnu.org; Sat, 05 Apr 2025 06:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u10Pl-0005rR-IC
 for qemu-rust@nongnu.org; Sat, 05 Apr 2025 06:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743847569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XoeSoyyJ2F5espFfNi2p9yngvN7wZuvpwxpgTgAMVw8=;
 b=OS/8Jr2dpJdbhfwcW7HwCiw3dfof/K7UAnniKOw1+0rnWR66VHuc6JsEodfYg8cXIC9sCQ
 RelFcPn49zaUejO6O8wf+1yOn+Xi1Ii9lkSrRAAQyFdhyVaEo7KWtEhCZQKuKg/1YiIxMo
 7WpyP0f0wDqXCALK5x+AqlCSjWby+x0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-47GhOhqrNF-uoEdG-0FhVA-1; Sat, 05 Apr 2025 06:06:07 -0400
X-MC-Unique: 47GhOhqrNF-uoEdG-0FhVA-1
X-Mimecast-MFC-AGG-ID: 47GhOhqrNF-uoEdG-0FhVA_1743847566
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so22076365e9.3
 for <qemu-rust@nongnu.org>; Sat, 05 Apr 2025 03:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743847566; x=1744452366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XoeSoyyJ2F5espFfNi2p9yngvN7wZuvpwxpgTgAMVw8=;
 b=fA8DDGln2kNMmgE1w1LdN7FR/PBFwpYiIpR03j1dybOOcUR7pM2QyBDsup3A5KhYh8
 0oTAW0EsYPndJqxvdAHHt5QI3FhJ+iVviKYsu7ql3vIhVEQR2iA9HfMYZrQqwzmFWfKg
 WlbqBMe5tFOClezJm50hL2H87u0coGG9k7slNQU9rXLelVzxtRmap9JSJJymcb19ZTo0
 irDpJpm3KPRrMqStZV7gyXU3Zk5K6KdvJFilOCEL74VwN03iFN+ErjDp6nkOu2oM1TFD
 mqACg8koBzeNYhjXQqLnXbOaPeh3Y/rqaqZiJsw0yJGHGiojVbMTx/KGvQ2qcTAybAM0
 TjMw==
X-Gm-Message-State: AOJu0Ywc+cKhGayKycUV3gpuuBoGzA3VoawOWtEyGxMRPVEzqCr9zV1E
 0WC+Q1Ch+/BzQMzsjbz9eXkdppgBeWTt7zm6zXeKft7JXoT+CqGuW/hRluZBpPx9zGWqgCvjPdD
 8T5r4NzlCFGjopdgrn9LywCKefLEhkRHwHkaJJbOCUg+s0exhJaYlBFembKE=
X-Gm-Gg: ASbGncs/G4ee2z6XyOeoW4OF/Lsls/xaW+gddBQbJ49Sa9JqIer8SFPI/JX4T2TtL18
 /zAX0lp6bZobgQQFTscQmOQqgRVVP/GaTU4hS4iAI5LLbzR7jRsNuXlkPCd4uS957A7gr0fv2vN
 71qeGQLy4eewymagk/E8AmRMT3JbaJWOEpDunkmttMQcj7RdwnHGdQS3aZx7CVNVRmyoGETg5PP
 Y4haFssEEk37h3ICdQKkxrk7/z49HnXehfUqUN/GsB+GCk+M3RGkRq7kWSP6KPHl5oHZXc95dSr
 FrhOkC2frqrfo+svIQ==
X-Received: by 2002:a05:600c:32a9:b0:43c:fd72:f039 with SMTP id
 5b1f17b1804b1-43ee0aa35bbmr14775185e9.11.1743847565955; 
 Sat, 05 Apr 2025 03:06:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9II0Z7ayPVeNsrJoPPMb6wgkFA4yqB/JtXUHDYD0K3rGBCCc1d/d4p47DNvpxLCQSd/XXhg==
X-Received: by 2002:a05:600c:32a9:b0:43c:fd72:f039 with SMTP id
 5b1f17b1804b1-43ee0aa35bbmr14775065e9.11.1743847565638; 
 Sat, 05 Apr 2025 03:06:05 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.96.77])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226959sm6321158f8f.82.2025.04.05.03.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 03:06:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH preview 0/3] rust: update build system for Meson 1.8.0
Date: Sat,  5 Apr 2025 12:06:00 +0200
Message-ID: <20250405100603.253421-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: huYDsg4cLFdkaQMZKMJ5Rncj8yRPNCXzl7oSsm09pG4_1743847566
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.028,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Sat, 05 Apr 2025 10:06:16 -0000

Meson 1.7.0 and 1.8.0 include improved support for Rust, namely:
* support for "objects" in Rust executables
* support for doctest targets

Use it to remove BQL-related hacks, fix --enable-modules --enable-rust
and also simplify the Meson logic for building the qemu-api crate
(which may help splitting the crate, too).

Meson also supports clippy and rustdoc but there are some bugs in the
prerelease.  I'll try to get them fixed before 1.8.0.

Paolo

Paolo Bonzini (3):
  rust: use "objects" for Rust executables as well
  rust: add qemu-api doctests to "meson test"
  rust: cell: remove support for running doctests with "cargo test --doc"

 docs/devel/rust.rst        |  2 --
 .gitlab-ci.d/buildtest.yml |  5 -----
 rust/qemu-api/meson.build  | 35 +++++++++++++++--------------------
 rust/qemu-api/src/cell.rs  | 22 +++++++++-------------
 4 files changed, 24 insertions(+), 40 deletions(-)

-- 
2.49.0



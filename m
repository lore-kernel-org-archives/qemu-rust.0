Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnems-0004Sw-Na
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemc-0003q6-C0
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemX-00044v-AS
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OAGa/1zAiQKppBasu/YtxlNDeSsZyMqPAmmwgiPHU8k=;
 b=a/GKmEY8PVyW57nTJw6qrszj4esTtOu/pgmvXNgrcRsy/EIZO5EHOIDcdqc1MLKULlkXnP
 bZByKwNQGVF7nzew1jbQUJ6upc0bugxGIDIJWhruEB+fxiN5COOFhhUftGAzAJ5wt/aV17
 2xjvZNOE1/dfZq0nzOLWy8aXF/6+oAc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-gR4pSIW-Mxi35nl40gvkmA-1; Thu, 27 Feb 2025 09:22:29 -0500
X-MC-Unique: gR4pSIW-Mxi35nl40gvkmA-1
X-Mimecast-MFC-AGG-ID: gR4pSIW-Mxi35nl40gvkmA_1740666149
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ab7f6f6cd96so111327166b.2
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666148; x=1741270948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAGa/1zAiQKppBasu/YtxlNDeSsZyMqPAmmwgiPHU8k=;
 b=mBePagK+kcfoB2RkaCdkvfr/mJpihofH1nuDHp9x9AblaRoXCxXTE+uCpdP/ChEMbR
 UppubcaioiVrKxE62wbtMWnZj2aE5nXHD5aw9n4G8hwBQJmyjheZdh4Wl7Vtpgdey1jh
 SgLqAfYuokPl1k2gWRhPEKAecCWNhN9vqIXHCthsCaL73gGrvSplgEnlABI7+YHVIxCp
 4pZbV7XcD9BeUBpSy8kjBzTgUSgiG4KypE2kExisQZTzzEmvtwaoRMCfovrr6c7fBUqV
 ZJybnXLDBVeOaWvAJeKyfjXq3b3Xw5xjEJeS9eiScy/obvl49cTOTxfSHSGlPEeeU6NA
 Hi9w==
X-Gm-Message-State: AOJu0Yx5LeLhlSI+guuM9Lf8iRtxJGy8G1LlRFIKUPn9Hg6h49e1DSox
 D2UiD268ss782bZrWJyDG/Q8O70gHSttOb7J3D8Bhc4ht096ygyj/YrabwmxDAftF9EIsVtGPuh
 C5T+fbYbAC6UO8QmjMPpeKXFeXUPxEdxIQmPK3LHNSpP4YX4mcm0XowT0FxLf/Q==
X-Gm-Gg: ASbGnctINrXLY/g39aOtMb/V77H7DReS3sEuss5e+BT1dyYF1OwCUPGpbetsYfYW9jB
 fbQMr5isHeskTabIv4l3rwajEbcRSwt08quzjqz9/qx/jwPVEhrNSW8iAN2bFXurJ4tL5mwf+ui
 7jokogBshKIXV0o0yuvSXVd4tgum4QRvah04xarNojEBsF6QeRGq16kQ217wn+8P6I350rLBU2o
 riB3KZ8XTfc2/qItwnH5dVsPIe3qvrJqBLUNL6wVU3M3g8mRJiOtU78DdBDY4J4g6THAqMM/w+t
 COCC+o69lrtTxRn6GiNj
X-Received: by 2002:a17:907:c0f:b0:ab6:d47a:9b20 with SMTP id
 a640c23a62f3a-abc09a8a15cmr3264749966b.31.1740666148285; 
 Thu, 27 Feb 2025 06:22:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4daWnQQOCN1bWh3SugyKqQgpaK2V8VPcdTd6AzyLvPLm6JBm1RPxBjICn07Gp4GTaMSKIQg==
X-Received: by 2002:a17:907:c0f:b0:ab6:d47a:9b20 with SMTP id
 a640c23a62f3a-abc09a8a15cmr3264746266b.31.1740666147824; 
 Thu, 27 Feb 2025 06:22:27 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c75bffcsm130517966b.143.2025.02.27.06.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 03/12] rust: vmstate: add std::pin::Pin as transparent wrapper
Date: Thu, 27 Feb 2025 15:22:10 +0100
Message-ID: <20250227142219.812270-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YCE5V4ECGPfiBbheBeVrMsEWUC2DL2UuNwEIOSYwBTY_1740666149
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:45 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 24a4dc81e7f..1e7ba531e2a 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -330,6 +330,7 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
 
 impl_vmstate_transparent!(std::cell::Cell<T> where T: VMState);
 impl_vmstate_transparent!(std::cell::UnsafeCell<T> where T: VMState);
+impl_vmstate_transparent!(std::pin::Pin<T> where T: VMState);
 impl_vmstate_transparent!(crate::cell::BqlCell<T> where T: VMState);
 impl_vmstate_transparent!(crate::cell::BqlRefCell<T> where T: VMState);
 
-- 
2.48.1



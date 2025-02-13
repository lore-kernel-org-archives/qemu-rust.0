Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiaGS-00005z-Ee
	for mharc-qemu-rust@gnu.org; Thu, 13 Feb 2025 09:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiaGP-0008Ty-OH
 for qemu-rust@nongnu.org; Thu, 13 Feb 2025 09:32:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiaGM-0007a5-Om
 for qemu-rust@nongnu.org; Thu, 13 Feb 2025 09:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739457141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qea6yNYTrWjUz32+OocmHw0yh1KpywotTecZ1bXmvrw=;
 b=UqvwDGDguNaMURB6JwOyskCK+Q/OV4oF0hC6RtOvUEfR6yG+NrTJFgcN29XgSRvWhM1tJa
 5TzYITm0Wg40QdayyIOa2VvzeUYa5r3lsCVaiOiD5dhuacQ3hmCqNbreiLZjcEzHsdv47a
 He9y5lGiI0BTsMazKgA6X8Xd0iWb4qg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-yulTgRE3NNGBsw-eiazBgQ-1; Thu, 13 Feb 2025 09:32:19 -0500
X-MC-Unique: yulTgRE3NNGBsw-eiazBgQ-1
X-Mimecast-MFC-AGG-ID: yulTgRE3NNGBsw-eiazBgQ_1739457139
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38dd533dad0so1098415f8f.0
 for <qemu-rust@nongnu.org>; Thu, 13 Feb 2025 06:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739457139; x=1740061939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qea6yNYTrWjUz32+OocmHw0yh1KpywotTecZ1bXmvrw=;
 b=O8pYuhmEAZmioHtZ0gWxzZHROcccTtBH6rUK+b1Hav/m+AHtPcpAh7lOzqZhki/1tR
 lUh6Uz5zOkbmLD5XZEWzMLEIZhxcKN+4jCDSlPOaiLrlZ3ilX2Mb+8tuW15Y6OIWdqME
 +6LQeVxn+merRvbHX1X/tbfz8dL7HgFgNM1u5omeIm/f2xjLN6GGTBB6MY7Ndg8CF30t
 Y66U6BJucaIFYIHyxRsGAXSTQa61S3iq/45kXOzWmfieZgUDo6To1UVte2bWBbyoixtq
 mGRQfVogbxaBF4It6/33DK8Wd0O9mVzDSqMoj8+zeFDDAgxVH+IbxXvEoH/Wby8ZcGXM
 XhTA==
X-Gm-Message-State: AOJu0YxTIASuQ/F/snMBAdD1T+st1P5Z13nN27NIfMiDzcc09pLao0Lx
 vG9aSFfqu73xYo/xUIW44VZxHwfQvAzeOaIlR56cBWq237/wVasbWT/71N7dLNu8g1e0VKB3h7H
 FhAPFIfDzvcXHR60ou/Qxr6g1ADB2+xIGHmqTNtrl4SXz0reRMWE=
X-Gm-Gg: ASbGncubjoXzjlwyASsax8zCIfRGYznwhpI67D+l1gxCnOtZ0zj2zUIbB/1xw+tz7P9
 QXGezzUsvDynBsHFabJDukXIPqJquLF1oYdfzAVX6+pviH5ZZoENLIp07U5Zn6UZBjsjrIRfVUZ
 zenXfHHxFSL66ywlPJfLfb7Jwinpyhg/4EefPxvv5nAmYWS/eTW8laY+YWVDW8lH5nkZ+hceDih
 2vrBVOnl14mgOhZwAwN7cFz4rs0AGLLU9uIkCsYpAKj7kJFLmoPXfmDZByTFj+tyg+rYKu4Au1s
 jE5btRqmYPnvHmS4sLkAofSbIz72kfCyWeKWTurlPSI=
X-Received: by 2002:a05:6000:1a8b:b0:38d:d8b2:cf14 with SMTP id
 ffacd0b85a97d-38dea28cffemr7169877f8f.30.1739457138753; 
 Thu, 13 Feb 2025 06:32:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFulb0e/UcHB1fD7u4l2gM6zcc/xErWRd9Hf2cdUaOy8xp7y+2KZbiE8tT4DYoEfT47bqK3ww==
X-Received: by 2002:a05:6000:1a8b:b0:38d:d8b2:cf14 with SMTP id
 ffacd0b85a97d-38dea28cffemr7169837f8f.30.1739457138401; 
 Thu, 13 Feb 2025 06:32:18 -0800 (PST)
Received: from [192.168.126.123] (93-40-58-165.ip37.fastwebnet.it.
 [93.40.58.165]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccd95sm2049929f8f.25.2025.02.13.06.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 06:32:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	kwolf@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH v2 0/2] rust: add module to convert between -errno and
 io::Error
Date: Thu, 13 Feb 2025 15:32:14 +0100
Message-ID: <20250213143216.3910163-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9astr4ZFJch2SnxC3Madk31EW6wvw-KYlEjedudLsOE_1739457139
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 13 Feb 2025 14:32:26 -0000

Wrap access to errno, for use in the block layer and character device
bindings.

Supersedes: <20250212093958.3703269-1-pbonzini@redhat.com>

v1->v2:
- use the libc crate
- provide separate From<Errno> implementation for io::ErrorKind
- hide GetErrno trait inside a submodule
- add into_neg_errno() and corresponding tests
- add more doctests
- make Errno field public, so that Errno can have other From<...>
  implementations (e.g. going from *mut Error to Errno).


Paolo Bonzini (2):
  rust: subprojects: add libc crate
  rust: add module to convert between -errno and io::Error

 rust/Cargo.lock                               |   7 +
 rust/qemu-api/Cargo.toml                      |   1 +
 rust/qemu-api/meson.build                     |   4 +
 rust/qemu-api/src/assertions.rs               |  28 ++
 rust/qemu-api/src/errno.rs                    | 342 ++++++++++++++++++
 rust/qemu-api/src/lib.rs                      |   1 +
 rust/qemu-api/src/prelude.rs                  |   2 +
 scripts/archive-source.sh                     |   2 +-
 scripts/make-release                          |   2 +-
 subprojects/libc-0.2-rs.wrap                  |   7 +
 .../packagefiles/libc-0.2-rs/meson.build      |  36 ++
 11 files changed, 430 insertions(+), 2 deletions(-)
 create mode 100644 rust/qemu-api/src/errno.rs
 create mode 100644 subprojects/libc-0.2-rs.wrap
 create mode 100644 subprojects/packagefiles/libc-0.2-rs/meson.build

-- 
2.48.1



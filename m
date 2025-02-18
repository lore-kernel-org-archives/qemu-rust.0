Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tkIgD-0007MN-PF
	for mharc-qemu-rust@gnu.org; Tue, 18 Feb 2025 03:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tkIgB-0007LL-Qi
 for qemu-rust@nongnu.org; Tue, 18 Feb 2025 03:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tkIgA-0008Q1-2t
 for qemu-rust@nongnu.org; Tue, 18 Feb 2025 03:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739866205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=I62z6j4t5NgwyQsJIwgqRn5DI4hoxiWvyWN3O/1WzarN9CMktIC1XKdQwKMVtGu6hpdYC5
 gJ5mWqr9vYCWd6q/gJCULV9ptWlafHQoWYGVlZMBM2mB8IMM7HRyPfWm5s0ymIwKHFFubo
 K48PANOHQ7WZLAYt1dfQjDzYkJkmSlo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-2u7tog1jPOS7qGr9LhGxLw-1; Tue, 18 Feb 2025 03:10:03 -0500
X-MC-Unique: 2u7tog1jPOS7qGr9LhGxLw-1
X-Mimecast-MFC-AGG-ID: 2u7tog1jPOS7qGr9LhGxLw_1739866203
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38f27bddeeeso4078281f8f.3
 for <qemu-rust@nongnu.org>; Tue, 18 Feb 2025 00:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739866202; x=1740471002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=a5HdT5cGzhv1OznfS3jwDnedtCylY6G3uQQF1Hlbl6Udnslf9yHI2j36ZY86A5kf9L
 /ST9W6JURobKQCzni0SlJIrpcuJ29NNk82qWdryHxT1CuLiJki7bbUyXuHLq1D4GOmwY
 Xc5uwhSz5I++NYKVi8PNs05+qM9/KbgBzf51PB1aDlbGrn9DzyLQyncpJ1s/O0pTHpM1
 n3BOB+ZA5k6AeswEEm14uuonvzQR+OSsYBg1QnAaITueQScQsFnXp8/Gl3Ovj202a9cE
 IJrGINMSQuUzkHEUGyvqPCWpK+2cQX96PzF7HcFtICDWqXEZuJgK7a5MeBlcqHL1wOyU
 IVRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlWX7xaR2f9w8iibvE4C0tcF7sxhBSG81wSBZ0+p5KR/SkXipjuVWcn5thVgBS4YHtlxbgl/49+Hs=@nongnu.org
X-Gm-Message-State: AOJu0YxzzW7SQnIRbufdT87JupdxMS2spXzyPW0Q6zBVaLDnRuOB94lD
 Hf9FELaLb1EHi7o1snUskfVHln/X5IBQox1uWVvCsLocfdlnE6k/6H4htILprTg9ZANbEetzpTI
 +ST4wi9+IAq09COzGb0ptGYVEKDbJZCicYYz8S9XHpxjX1n1Ccmu7r+54usesFA==
X-Gm-Gg: ASbGncuP9LuoGTjnsLjIV6cX/5bYhLnU53Q3rUOmB9aGJChE6FYKQqPjBwmOfqPhsDI
 NQeCy3gPeTSlkFbsPBjYR+WJ4KyN38FZGXgUN9nMGkH7J5n3rjq2V5IxCJyuPfuTyxUPFcuuPMl
 ACX5/NDqI9dPihuNiy5kaDMYLDOQNEgymwECuFEVIaeSDpZAGT25VCWDcWKJo/2GONyD/825bgY
 Vy7mX7SYxT3iSmfmU05VTcfZFqOYgPAHObTlJ6rMq7J/MMSnXV08xXssGFxeHDPjKC528T2sBEb
 S0Vzf45GFfw=
X-Received: by 2002:a5d:50cd:0:b0:38c:5e03:5bb with SMTP id
 ffacd0b85a97d-38f33f51191mr11134010f8f.41.1739866202364; 
 Tue, 18 Feb 2025 00:10:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdHkGsLvx5BB0pMui/Y6m3zGmUy9i8EvLutO1qkUbx1cmyFKEXR4C0wf+mtetYDNqJCVssmg==
X-Received: by 2002:a5d:50cd:0:b0:38c:5e03:5bb with SMTP id
 ffacd0b85a97d-38f33f51191mr11133966f8f.41.1739866202031; 
 Tue, 18 Feb 2025 00:10:02 -0800 (PST)
Received: from [192.168.10.48] ([176.206.122.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258f5efdsm14101840f8f.43.2025.02.18.00.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 00:10:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org,
	qemu-rust@nongnu.org
Subject: Re: [PATCH] rust: Prefer std::ptr over core::ptr
Date: Tue, 18 Feb 2025 09:09:59 +0100
Message-ID: <20250218080959.430745-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218080835.3341082-1-zhao1.liu@intel.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uxbRM0gMu7wGoCmAixa5YcSq7mLuzXrpL5gv83AmByE_1739866203
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 18 Feb 2025 08:10:08 -0000

Queued, thanks.

Paolo



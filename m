Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t9R1p-0000it-R3
	for mharc-qemu-rust@gnu.org; Fri, 08 Nov 2024 10:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t9Qgm-0004RU-5d
 for qemu-rust@nongnu.org; Fri, 08 Nov 2024 10:14:21 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t9Qgf-00016b-07
 for qemu-rust@nongnu.org; Fri, 08 Nov 2024 10:14:17 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5cb615671acso1476994a12.1
 for <qemu-rust@nongnu.org>; Fri, 08 Nov 2024 07:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731078849; x=1731683649; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iz4zLuqnG0fh35dcQoPgRmjAN517l8b2XuGgwH2ZeXE=;
 b=ocp7Abv2IBltXrahyzmPm0nv1MGZbUnJmHebIjxYzNGLAlp7OasTWBpmMG3CtKw+OC
 cxfrAw3SKkSh64DmR/jMwtU9jD4KHx8SdzPVIsns02LXAqgz25ebjXhhPdiDw4xNBO1j
 cOn7hupUtr7/OJmkLQhJSoFObFh9+no6rnudOFArh3+G9cAnWO1AE1IvGnna6b1m/xFD
 3GvVzNmAyVxNd9IoZffuH8qnyFn4XHSGkr8K5EozV3m763+3wtBkA9bzVWovrJwf3AQg
 im43YPIoRx1qQbteZeutQbb7UicepzFThCZs243bmpHalmJhEADbGBVak2+iWy0rkTCX
 kRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731078849; x=1731683649;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iz4zLuqnG0fh35dcQoPgRmjAN517l8b2XuGgwH2ZeXE=;
 b=g3gsvMSlPtvu/4FHmske3mYGZ3d1nNrVWpxbJWCZqn07ScC3NuVKUZZD/E3mW7iEAT
 DHfLAcEVYJtHcqx+RLtr9gS/OM/veW/htEtQSYsZ/9Ykr7YJsVNdV4Oo4okI4nfvefwH
 gESIZPzosBa8vaHpMLGyBsYUP4vDyizTHMo1pFRIaflv1PqVRcuZQ8tiH8/RUtu1ex5a
 X/xzXo+iT2z3B5BI+2f9zVJceMEXC2hxs3llx4yFJ7xEi0FKHzJF01C304MNovM3Pr8U
 lDCV5hrJu7jQDnc4b6QVOnu+KzHTNvd95Z2e2LmNzuLhC63NKPasW/lcQuvBj/Y0VqwD
 LpnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhcDvP7TbSsUtYH8wZ+K+xHi2U2DZvSj197lenFHc+hEOYmSZNfv612YAFwBfLKy8WHOqOd5Kd8sI=@nongnu.org
X-Gm-Message-State: AOJu0YzXeQTOMoyMsTKUiwL+Lzy1HfAgHTVHBnvqTYcYk+g4P/imFKRS
 4XwDr+JfwjvpIRyU79+cEaipWtXmhKwGS6yNehy2ClPCeWnJS8wOQjo5yYSb0SFmZbuVa54oRUO
 C4cPRzNGkFZp4x6m/MJtdK2pLdGVJ6QYIhtvlvQ==
X-Google-Smtp-Source: AGHT+IGZj/4nz2L8j740u7N//4DZstGApmKU3aIOlKkBxkJt9+eRXPjPP5mewHtEM6MrTIZWjk1d7r8GasS2GEnt0Ws=
X-Received: by 2002:a50:8d02:0:b0:5cf:8bc:9f68 with SMTP id
 4fb4d7f45d1cf-5cf0a43f0d4mr2553302a12.23.1731078848728; Fri, 08 Nov 2024
 07:14:08 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Nov 2024 15:13:58 +0000
Message-ID: <CAFEAcA-ZQuyGTtG-vhRTEwpz0L4cpimNxkKix45Yw6gVHXozRQ@mail.gmail.com>
Subject: qemu-rust@nongnu.org mailing list created
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Nov 2024 10:36:04 -0500
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
X-List-Received-Date: Fri, 08 Nov 2024 15:14:25 -0000

One of the things suggested at the KVM Forum Rust BoF was creating
a qemu-rust mailing list. This is going to be one of our usual
qemu-foo lists along the lines of what we have already for
qemu-block, qemu-arm, etc, and the standard policy applies: emails
to qemu-rust should also cc qemu-devel so people subscribed to
qemu-devel only can see traffic. The separate list will hopefully
assist people who want to follow Rust-related discussion and patches
in identifying those emails.

You can subscribe here if you like:
 https://lists.nongnu.org/mailman/listinfo/qemu-rust

The list should be set up with basically the same config as qemu-devel;
in particular it accepts posts from non-members (though there might be
a slight delay on first posting from a non-member).

Please cc qemu-rust on future Rust related discussions and any
patches that touch or add Rust code.

thanks
-- PMM


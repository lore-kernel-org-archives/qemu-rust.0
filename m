Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uApW8-0007w1-FL
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 08:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uApW1-0007uN-Mg
 for qemu-rust@nongnu.org; Fri, 02 May 2025 08:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uApVy-0001UV-F8
 for qemu-rust@nongnu.org; Fri, 02 May 2025 08:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746188953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pyhtS2uCUy7iL3ya9hKovSx5GvTB1tKkzenjMRuLgFk=;
 b=GCbYJlqTKloFW0IQB+88Exps+zp1886XeXLBHjWLzm4fMbdkWzV644oiykoSgOFVtaj64D
 K4KKLQilNmhuadDNBZXuT568wWGM4B3/Rhdwy6MBP06wKdQ6P4EZK+XFdGxkcA1BahuyCA
 iV1cTeXuMH1mOIrtppbPf6AY23ZlvA0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-t2g9wo31PKOdxC5MZtZvDA-1; Fri, 02 May 2025 08:29:12 -0400
X-MC-Unique: t2g9wo31PKOdxC5MZtZvDA-1
X-Mimecast-MFC-AGG-ID: t2g9wo31PKOdxC5MZtZvDA_1746188951
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d0a037f97so9575165e9.2
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 05:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746188950; x=1746793750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pyhtS2uCUy7iL3ya9hKovSx5GvTB1tKkzenjMRuLgFk=;
 b=YD2S9ykrBFEWrIGcBDPqMuQ9h1g+J/eRMXeGBU8Gk4QhShdrN7/ENQsmlFXt63pmJ7
 orwle1tHjfF6uNsc+PltGQMD7zOdZG+nrmM7Lwsh5FYvctAODS/Z3YRCsZ44sKXPVu62
 xoll1GLpKKyuFXS+0o/0ZCNNfiW96L9y3Wu72dBnOvMokpx3oSWDVXkpJmcEol4jTugs
 CnPVHXCnBYxPcD6mrMFfW40dFXmQOQ6dsy8R5WA74KFUBRZ+4syPmuD/v2Mct//vAeFF
 5xL0z1HKHfnUayDop1bolUCi15HrpsammFKAzcGUKXWOkjzfM/PeZljVo1PlMRrn3uzE
 d4OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgQxuFD9PZqZI0XYyem0YA+jihak/WBHE1InA/ylXCGsQbsSFHrsK9pX9DnBaNKbxrvmWsGbM1vHA=@nongnu.org
X-Gm-Message-State: AOJu0YwNqblobrDdwq7GEiGPhiobPaLS9EKa9zM6LblfFjnZmnfmCRw7
 6YNmB9crZKgABrQkIElGsqD72LUCZKo/AS/TLcrNFMt7B4PhJGox2SbLH5Sma4BC/MSE9R66WP/
 NCbl6klEBwjgIwmkBY/LPGQUrj5Z/AuVOsw3c3RSzzuPwleW/pRuW40X8HYxf8pif8x29uAIgSX
 WlwxG0cdqaukDoLoQ7W9/tnxYUMHyZs9Lp+s6U
X-Gm-Gg: ASbGncvOr9mYKyl341TqGHMY+A4eXEKfzensARWXJED7uJ+dEc9K9DNEglgSdaEXTuO
 fX1CEvPg0ueJfmZ6+CGgiNy7Ig9e08Mev+AZT6ZizRkGvZOosJbNnkIeIg1U7+T/avL08
X-Received: by 2002:a5d:47c7:0:b0:3a0:8311:c455 with SMTP id
 ffacd0b85a97d-3a099add09fmr1806094f8f.34.1746188950089; 
 Fri, 02 May 2025 05:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLZFlXf2lp9WA/tIQsBsszXkbG8qf9GAk4OoktKQF2lvQtV8y2sjv5VTLhLKD7tyhP+kqMvJr1F1qOsdeAo2Q=
X-Received: by 2002:a5d:47c7:0:b0:3a0:8311:c455 with SMTP id
 ffacd0b85a97d-3a099add09fmr1806077f8f.34.1746188949766; Fri, 02 May 2025
 05:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-9-pbonzini@redhat.com>
 <svmsie.1mbmcen6stmg8@linaro.org>
In-Reply-To: <svmsie.1mbmcen6stmg8@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 2 May 2025 14:28:58 +0200
X-Gm-Features: ATxdqUHmrHkquSDScmWwvBBSLl3MuJcS6CMNjeLmb6gUUc2uUyRtb8V4OXi-UdI
Message-ID: <CABgObfZJ0Jvxwdd7T2VjAkiYA90SyfSqy-D8OO4ZYp-2wMtwOQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] rust: enable clippy::ptr_cast_constness
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _5UIjBl4J6vMRcTbVKfowPfLalJGGUPkRtW8KA6G2BI_1746188951
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
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
X-List-Received-Date: Fri, 02 May 2025 12:29:22 -0000

On Fri, May 2, 2025 at 1:13=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
> msrv/rust-version bumps could instead go in the patch that also updates
> meson.build version.

Good idea, I was mistaken that ptr_cast_constness was already enabled
by bumping them, but it's actually default-allow.

Paolo



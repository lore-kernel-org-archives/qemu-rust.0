Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvhH7-0000RN-ID
	for mharc-qemu-rust@gnu.org; Fri, 21 Mar 2025 14:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tvhGq-0008Dv-1p
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 14:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tvhGi-0007Rt-U2
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 14:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742582333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDALIBM4gMiaNAApgGYrdP8RMIx4DhGMy9icvxj4R64=;
 b=UHoxbQQAOYmbhnpdpsUU4tUw8XyPGdgpP4Z3Wcnxxq4quFB50c5R+QyqWPTm4U7u5XGlyI
 pm19CNuLb+YFbzHcS1fqXaESMwJEJG0LfuXcv33ID0QP3jaydn64Vy1LaTqMYhooFX1Yzm
 LfdxKrGYks6fMPW29lLnich2+F21ka4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-eLw1SBEFMk2U-5IgOPshvQ-1; Fri, 21 Mar 2025 14:38:52 -0400
X-MC-Unique: eLw1SBEFMk2U-5IgOPshvQ-1
X-Mimecast-MFC-AGG-ID: eLw1SBEFMk2U-5IgOPshvQ_1742582331
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3912fe32a30so943924f8f.1
 for <qemu-rust@nongnu.org>; Fri, 21 Mar 2025 11:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742582331; x=1743187131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDALIBM4gMiaNAApgGYrdP8RMIx4DhGMy9icvxj4R64=;
 b=pVqCoiKzNccqpO2ZATqWOEvQdiWs5EHSrKzb2WQVh2ZiWwKgi7vgUFWhPvkT46RG0I
 389NSo3aTx2p5QEki5PLWKveW1kkl1NzTdAMx5JIZk8uciaLjsLURMlbgC82VwTxF2De
 6iI111RFignwr81wd/EFZr21rY5x9iuunW9iOCCKwY8xYJOVG54D2pnhqBm++ofI8o+D
 HFecGscPYLMNenwrcS06kxFfE28rTqZYoPN3Vb5TRzHw1FXcn8IkIpcASq1HAo4n/bCX
 /ZW+XRlGhJnqqvd1BFwnWRjras7vCQ2GfwmS9kR3D3ob8kn0XtloYF1LHOllgSyjUdZR
 iJhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWruioJteyolXC4sZuySRapcgkFCRw3TOHkkpPd1pqVykyOGyRXyNy8dxsIW0qt+PjBeoc5MvEHnk4=@nongnu.org
X-Gm-Message-State: AOJu0Yztw0BwE25QpHwdRttbAA7VUjMPiM+8maFcZbiGaN3CAufZsBH2
 jrttZ5yyCPBnXMYjaJnjtbtvmqDzfKuz/dp1i147CZ03qtEDgmrYf8EhJ3Mvjl0zeo9kj/aGiZo
 tWLKeN9CcWO6usAvBp+0vkWmCb5xoDeCE5t5AzoMTsv518oxWVQLDG19vymuD+AKtTWYwRrBIIm
 XZI0Vu/0iSH5ItgoM8SQykHMolwA==
X-Gm-Gg: ASbGnctGviZUOKzjCeEi3c/rVVotSKEm0q19j3aVIVdUEJc0lgajSTZBJoVx6rWZpL0
 1xub0QMx0WcW+MnddJ7nCs0quTxHoyEX5ETfrUPidA41bj2oeDOw4JLhtMSbSXsi8kpWX+3BjFA
 ==
X-Received: by 2002:a5d:47c6:0:b0:391:2e31:c7e8 with SMTP id
 ffacd0b85a97d-3997f8f607emr4457096f8f.2.1742582331200; 
 Fri, 21 Mar 2025 11:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIlqlX66izdOh82aBOqkftva00zw5ORRhrwFy+i8UHhmqXKIrXVNggEq6yecqGglgLRpzjm9PnSGb9uorCTM=
X-Received: by 2002:a5d:47c6:0:b0:391:2e31:c7e8 with SMTP id
 ffacd0b85a97d-3997f8f607emr4457080f8f.2.1742582330845; Fri, 21 Mar 2025
 11:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250321133339.116081-1-pbonzini@redhat.com>
 <CAFEAcA_h6VDA6E1=DHN5LyuekhmXcD8JpEUEjsHboPSDK-VdAg@mail.gmail.com>
In-Reply-To: <CAFEAcA_h6VDA6E1=DHN5LyuekhmXcD8JpEUEjsHboPSDK-VdAg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 21 Mar 2025 19:38:39 +0100
X-Gm-Features: AQ5f1JomymMNZMaM7aFWmAs-fBOdN18RWYlADRdUPTgJsz79_irnBF8E-K8umhQ
Message-ID: <CABgObfY3hEAUvUjEZg5cgF+-sNhZdQmBCKpDNyYBdtR3e23Obw@mail.gmail.com>
Subject: Re: [PATCH] rust: hpet: fix decoding of timer registers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0c4NgmJm4bQjBnGUUVDLOnvGPirANS1UGgJQPsJbYFg_1742582331
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Fri, 21 Mar 2025 18:39:12 -0000

On Fri, Mar 21, 2025 at 3:26=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
> Tested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> If I understand the code correctly I think you could also
> write this as "addr & 0x1f" which might be a little nicer
> as it then lines up with the "/ 0x20".

Yeah, I was undecided between that and 0x18... in the end I went with
0x18 because bits 0-1 are clear (due to alignment) and bit 2 is
cleared above, and the TimerRegister enum also has "0x18" in the
comment.

Paolo



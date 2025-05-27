Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJvOC-0005zh-UU
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 10:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJvNz-0005xz-L1
 for qemu-rust@nongnu.org; Tue, 27 May 2025 10:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJvNj-0002VX-8f
 for qemu-rust@nongnu.org; Tue, 27 May 2025 10:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748356456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Mk1fXbk81YdLtCsSDKMZTpfd63H0PVVPW2BS//swE6o=;
 b=NSLEyy/Ae+NLDbIlrZCMMB+AYqgT7GCEr35UYQsQUO2RCL5/4M8KI47PlNssopWT+Ae3Lk
 VjrFEhPx8jBsdNyuWeVTMrVkV9aasyJFWyNsOQOtApz1FFWi/uqcEkVVEUmtQCDRvNa1N1
 dwUlj9F/O0wN0zsOB+WQbMwVyzsv1iY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-mTNIDA5EOeaDFFw5z9Wucw-1; Tue, 27 May 2025 10:34:15 -0400
X-MC-Unique: mTNIDA5EOeaDFFw5z9Wucw-1
X-Mimecast-MFC-AGG-ID: mTNIDA5EOeaDFFw5z9Wucw_1748356454
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ad8816c50e1so123656666b.0
 for <qemu-rust@nongnu.org>; Tue, 27 May 2025 07:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748356453; x=1748961253;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mk1fXbk81YdLtCsSDKMZTpfd63H0PVVPW2BS//swE6o=;
 b=hr7eIAAdZjsp9ciXVIlhVPUCrgwzlxmyq3k0v6Qy1gc+ZZ+JWk8hiTJERZ0WouAXao
 s0kr9a38xBlzkemX9i2uk6kt6HbYQw/25pPxORiplP7dkzq10G24B1neAkDoWYbiCimR
 jSrJtYr+IJHOpReJhNYKQo1yTwDKtwPqYeHTp1iUwBvAhg2fpn/YKRxMyXkBT28+IcCM
 7tXqW3ciXeXzwz6n/Kj46yoBMa+YfamDSbVMIIPP3qghUPIuIYBNLqGRkdJq1rdggBvi
 Hyw8RCi1yn+tqMfGX234IzDyd1Igly7uFJYmT5FHmLQkA2OM93xONf5UN8kS7mkI9U4W
 IS9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX52sU0+reUxchCGMXfW1pL/BDVc+wJysqf84Wpd2C0nzMcvDgHi47ACi1YKlEWkUkpKgmlAasLvrI=@nongnu.org
X-Gm-Message-State: AOJu0YwszwDC/Kv84qf9HR+9rpZjx5ut4QgXFWDWplgmqjvC5XPnsMkv
 Ezp+qzxvA7P6N48balJzYbPMjVdIWMMJ6tOLdEz7LZjqkFT5LrY0nre0htyxnAl5y8Vdr0xZx8d
 bs+JofJVjY6SQ3YkOYgbCNW/Xwcb+c+gJCitEk2n1y5JC+50zA4ASDL57kq85fNo=
X-Gm-Gg: ASbGnctj03gesTITNbEl5hwaHo4K7sR0+PE/n70O63r7czuCPGXrUvQYq9v5+M7BwNh
 Xw8yigHL8iS0W+8OAohm7WyDm1NSuYorN+jO3DqpOv+0yIg9nopBWy/xuxfln+KPttCzLQ58ODi
 qus0z9Kgoxcb9Dt3fDweuqePToJ9g8fink6mMsrT09VDtD6+5c3tr4pgkC+4/lKhShgCtXDJ6gK
 /6ZgUp1ZKn/Nisio4WxCWHHOV2wqOKR3fF2MmOucsfOiJ3+pQRp8PKzeplDTyjnZQB2f4ZffP0l
 1hvUAay1B8TzxA==
X-Received: by 2002:a17:907:971d:b0:ad8:9811:c0c2 with SMTP id
 a640c23a62f3a-ad89811c2acmr102877966b.61.1748356453215; 
 Tue, 27 May 2025 07:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEem5YfwEj6pamo7GYwyxFuYkaO6YqPZMB0x5wx56szzRm+Snw/QZYE2AbF/Ul23Y+7B1JMOg==
X-Received: by 2002:a17:907:971d:b0:ad8:9811:c0c2 with SMTP id
 a640c23a62f3a-ad89811c2acmr102875666b.61.1748356452712; 
 Tue, 27 May 2025 07:34:12 -0700 (PDT)
Received: from [192.168.10.27] ([151.95.46.79])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ad52d278290sm1844489066b.78.2025.05.27.07.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 07:34:12 -0700 (PDT)
Message-ID: <feb8251e-715f-4de7-a390-eb5b053de0f6@redhat.com>
Date: Tue, 27 May 2025 16:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] util/error: allow non-NUL-terminated err->src
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250526142254.1061009-1-pbonzini@redhat.com>
 <20250526142455.1061519-5-pbonzini@redhat.com> <87sekqmapy.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <87sekqmapy.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sco_EADOWDn7LGh4g606n3NxpErXPZ-D8VXuUqGJG_c_1748356454
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
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
X-List-Received-Date: Tue, 27 May 2025 14:34:39 -0000

On 5/27/25 15:42, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Rust makes the current file available as a statically-allocated string,
>> but without a NUL terminator.  Allow this by storing an optional maximum
>> length in the Error.
>>
>> Note that for portability I am not relying on fprintf's precision
>> specifier not accessing memory beyond what will be printed.
> 
> Can you elaborate on the portability problem?  I figure ...
> 
>>   {
>>       if (errp == &error_abort) {
>> +        const char *src = err->src;
>> +        if (err->src_len >= 0) {
>> +            /* No need to free it, the program will abort very soon...  */
>> +            src = g_strndup(err->src, err->src_len);
>> +        }
>>           fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
>> -                err->func, err->src, err->line);
>> +                err->func, src, err->line);
> 
> ... you're avoiding the simpler
> 
>             fprintf(stderr, "Unexpected error in %s() at %.*s:%d:\n",
>                     err->func, err->src_len, err->src, err->line);
> 
> because of it.

I couldn't find anything that says %s is allowed to not be 
NUL-terminated if a precision is given.  That is, whether something like 
this:

    char foo[] = {'H', 'e', 'l', 'l', 'o'};
    printf("%.5s\n", foo);

is guaranteed to work.

This is opposed to:

1) strnlen 
(https://pubs.opengroup.org/onlinepubs/9699919799/functions/strnlen.html), 
which is guaranteed to examine no more than the number of bytes given by 
the second character;

2) strndup, for which I found at least a clarification at 
https://www.austingroupbugs.net/view.php?id=1397.

3) g_strndup, which guarantees that the allocated block is of length n+1 
and padded with NULs (though in the case above there will be just one 
NUL anyway)

And also, for strndup/g_strndup it would be quite asinine to implement 
it using some kind of min(strlen(s), n) but for printf the complexity is 
greater so you never know.  I erred on the side of caution because 
avoiding an allocation before an abort() isn't particularly interesting.

Paolo


